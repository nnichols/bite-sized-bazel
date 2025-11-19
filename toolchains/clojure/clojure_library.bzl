"""
Builds a JAR from the source files and dependencies
"""

def _clojure_library_impl(ctx):
    toolchain = ctx.toolchains["//:clojure_toolchain"]

    jar = ctx.actions.declare_file("%s.jar" % ctx.label.name)
    build_location = ctx.build_file_path[0:ctx.build_file_path.rfind("/BUILD")]

    args = ctx.actions.args()

    # The JVM classpath
    args.add_joined("-cp", toolchain.files.runtime, join_with = ":")

    # The location of the clojure compiler
    args.add("clojure.main")

    # The clojure script we're using to compile a library
    args.add(toolchain.scripts["library.clj"])

    # The directory we're building from- which we're using to fix resource paths
    args.add("--build-location", build_location)

    # The declared target file we'll be producing
    args.add("--jar", jar)

    # Source code files
    args.add_all(ctx.files.srcs, before_each = "--src")

    # Static resources
    args.add_all(ctx.files.data, before_each = "--data")

    ctx.actions.run(
        executable = toolchain.java,
        arguments = [args],
        inputs = ctx.files.srcs +
                 ctx.files.data +
                 toolchain.files.runtime +
                 toolchain.files.scripts +
                 toolchain.files.jdk,
        mnemonic = "ClojureLibrary",
        progress_message = "Building %s" % ctx.label,
        outputs = [jar],
    )

    # Provide the JavaInfo dependency information required by consumers
    return [
        DefaultInfo(
            files = depset([jar]),
        ),
        JavaInfo(
            output_jar = jar,
            compile_jar = jar,
            source_jar = jar,
            deps = [dep[JavaInfo] for dep in ctx.attr.deps],
        ),
    ]

clojure_library = rule(
    doc = "Builds a JAR containing the sources with the paths corresponding to namespaces.",
    attrs = {
        "srcs": attr.label_list(
            mandatory = True,
            allow_empty = False,
            allow_files = [".clj", ".cljc"],
            doc = "Clojure source code files.",
        ),
        "deps": attr.label_list(
            default = [],
            providers = [JavaInfo],
            doc = "Libraries used as dependencies of this library.",
        ),
        "data": attr.label_list(allow_files = True),
    },
    provides = [JavaInfo],
    toolchains = ["//:clojure_toolchain"],
    implementation = _clojure_library_impl,
)
