"""
Defines the clojure_binary rule, which makes clojure scripts executable via `bazelisk run`
"""

def _clojure_binary_impl(ctx):
    toolchain = ctx.toolchains["//:clojure_toolchain"]
    classpath = ctx.actions.declare_file("%s.classpath" % ctx.label.name)

    # The compiler has direct dependencies satisfied by the toolchain
    # The generated classpath has transitive dependencies of what the underlying code requires
    deps = depset(
        direct = toolchain.files.runtime,
        transitive = [dep[JavaInfo].transitive_runtime_jars for dep in ctx.attr.deps],
    )

    # Write a classpath file containing all of our code dependencies and our static resources
    ctx.actions.write(
        output = classpath,
        content = ":".join(
            [f.short_path for f in deps.to_list()] +
            [f.dirname for f in ctx.files.data],
        ),
    )

    ctx.actions.write(
        output = ctx.outputs.executable,
        content = """
        set -ex
        BAZEL_ROOT=$(pwd)

        # The Python-casing of booleans is shared by Starlark
        if [[ {execute_in_workspace} == "True" ]]; then
          cd "$BUILD_WORKSPACE_DIRECTORY"
        fi

        FULL_CLASSPATH_FILE="$BAZEL_ROOT/full_classpath"
        sed -E "s=(^|:)=\\1$BAZEL_ROOT/=g" $BAZEL_ROOT/{classpath} > $FULL_CLASSPATH_FILE

        # We might have navigated outside of the execRoot, so we need to supply an absolute path for the Java executable
        $BAZEL_ROOT/{java} \
          -XX:-OmitStackTraceInFastThrow \
          -classpath @$FULL_CLASSPATH_FILE \
          clojure.main \
          -m {main} \
          {data} \
          {arguments} $@
        """.format(
            java = toolchain.java_runfiles,
            classpath = classpath.short_path,
            main = ctx.attr.main,
            data = "--data {}".format(":".join([f.short_path for f in ctx.files.data])) if ctx.files.data else "",
            arguments = " ".join(ctx.attr.arguments),
            execute_in_workspace = ctx.attr.execute_in_workspace,
        ),
    )

    return DefaultInfo(
        runfiles = ctx.runfiles(
            files = ctx.files.data +
                    toolchain.files.jdk +
                    [classpath],
            transitive_files = deps,
        ),
    )

clojure_binary = rule(
    doc = "Executes a clojure program as a runnable script",
    implementation = _clojure_binary_impl,
    executable = True,
    attrs = {
        "main": attr.string(
            mandatory = True,
            doc = "The namespace whose -main function is the target for execution.",
        ),
        "deps": attr.label_list(
            mandatory = True,
            allow_empty = False,
            providers = [JavaInfo],
            doc = "Libraries to link as dependencies of this binary.",
        ),
        "arguments": attr.string_list(
            default = [],
            doc = "A list of string arguments to pass to our script.",
        ),
        "data": attr.label_list(
            allow_files = True,
            doc = "Static data dependencies required at runtime",
        ),
        "execute_in_workspace": attr.bool(
            default = False,
            doc = "A boolean that determines if the script should execute in the workspace or the execRoot.",
        ),
    },
    toolchains = ["//:clojure_toolchain"],
)
