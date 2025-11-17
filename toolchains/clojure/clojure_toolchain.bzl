"""
Provides the JDK and Clojure Compiler to our rules
"""

def _clojure_toolchain(ctx):
    return [platform_common.ToolchainInfo(
        runtime = ctx.attr.classpath,
        # Load scripts which will execute Clojure code to perform the actual actions of the toolchain
        scripts = {s.basename: s for s in ctx.files._scripts},
        jdk = ctx.attr._jdk,
        java = ctx.attr._jdk[java_common.JavaRuntimeInfo].java_executable_exec_path,
        java_runfiles = ctx.attr._jdk[java_common.JavaRuntimeInfo].java_executable_runfiles_path,
        files = struct(
            runtime = ctx.files.classpath,
            scripts = ctx.files._scripts,
            jdk = ctx.files._jdk,
        ),
    )]

clojure_toolchain = rule(
    doc = "Provides the dependencies necessary to run JVM clojure",
    implementation = _clojure_toolchain,
    attrs = {
        "classpath": attr.label_list(
            doc = "A list of JavaInfo dependencies which will be implicitly loaded into consuming classpaths. Must contain clojure.jar for the compiler",
            providers = [JavaInfo],
        ),
        "_scripts": attr.label(
            doc = "The clojure code needed to execute the compiler, test executor, etc.",
            default = "//toolchains/clojure/impl:scripts",
        ),
        "_jdk": attr.label(
            doc = "The JDK used to execute the clojure compiler",
            default = "@bazel_tools//tools/jdk:current_java_runtime",
            providers = [java_common.JavaRuntimeInfo],
        ),
    },
    provides = [platform_common.ToolchainInfo],
)
