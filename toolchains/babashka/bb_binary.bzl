"""
Defines the bb_binary rule, which makes babashka scripts executable via `bazelisk run`
"""

def _bb_binary_impl(ctx):
    toolchain = ctx.toolchains["//:babashka_toolchain"]
    executable = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = executable,
        is_executable = True,
        content = """
        set -x
        exec {bb} {src} {arguments} "$@"
        """.format(
            bb = toolchain.bb.short_path,
            src = ctx.file.src.path,
            arguments = " ".join(ctx.attr.arguments),
        ),
    )

    return DefaultInfo(
        executable = executable,
        runfiles = ctx.runfiles(files = [toolchain.bb, ctx.file.src]),
    )

bb_binary = rule(
    doc = "Executes a babashka script",
    implementation = _bb_binary_impl,
    executable = True,
    attrs = {
        "src": attr.label(
            doc = "The `.clj` file containing the source code of the script to execute.",
            allow_single_file = [".clj"],
            mandatory = True,
        ),
        "arguments": attr.string_list(doc = "A list of string arguments which will be provided in-order to the script."),
    },
    toolchains = ["//:babashka_toolchain"],
)
