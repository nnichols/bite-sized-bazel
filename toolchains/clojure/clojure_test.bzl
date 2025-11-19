"""
Executes clojure tests with clojure.test
"""

def _clojure_test_impl(ctx):
    toolchain = ctx.toolchains["//:clojure_toolchain"]
    classpath = ctx.actions.declare_file("%s.classpath" % ctx.label.name)

    # The compiler has direct dependencies satisfied by the toolchain
    # The generated classpath has transitive dependencies of what the underlying code requires
    deps = depset(
        direct = toolchain.files.runtime,
        transitive = [dep[JavaInfo].transitive_runtime_jars for dep in ctx.attr.deps],
    )

    # Write a classpath containing all of our test code, the static data dependencies, and declared dependencies
    ctx.actions.write(
        output = classpath,
        content = ":".join(
            [f.short_path for f in ctx.files.srcs] +
            [f.dirname for f in ctx.files.data] +
            [f.short_path for f in deps.to_list()],
        ),
    )

    # The actual executable we'll invoke to run our test script
    ctx.actions.write(
        output = ctx.outputs.executable,
        content =
            """
            set -ex
            BAZEL_ROOT=$(pwd)
            FULL_CLASSPATH_FILE="$BAZEL_ROOT/full_classpath"
            sed -E "s=(^|:)=\\1$BAZEL_ROOT/=g" $BAZEL_ROOT/{classpath} > $FULL_CLASSPATH_FILE

            {java} \
              -XX:-OmitStackTraceInFastThrow \
              -classpath @$FULL_CLASSPATH_FILE \
              clojure.main \
              {script} \
              {sources}
            """.format(
                java = toolchain.java_runfiles,
                classpath = classpath.short_path,
                sources = " ".join([f.path for f in ctx.files.srcs]),
                script = toolchain.scripts["test.clj"].path,
            ),
    )

    # Make sure all of our dependencies are available for test execution, including the toolchain
    return [
        DefaultInfo(
            runfiles = ctx.runfiles(
                files = ctx.files.srcs +
                        ctx.files.data +
                        toolchain.files.scripts +
                        toolchain.files.jdk +
                        [classpath],
                transitive_files = deps,
            ),
        ),
    ]

clojure_test = rule(
    doc = "Runs clojure.test against the source files.",
    test = True,
    implementation = _clojure_test_impl,
    attrs = {
        "srcs": attr.label_list(
            allow_files = [".clj", ".cljc"],
            doc = "clojure source files with tests.",
            mandatory = True,
        ),
        "deps": attr.label_list(
            default = [],
            providers = [JavaInfo],
            doc = "Libraries containing required test-time dependencies.",
        ),
        "data": attr.label_list(allow_files = True),
    },
    toolchains = ["//:clojure_toolchain"],
)
