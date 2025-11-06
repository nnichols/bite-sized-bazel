"""
Defines the bb_genrule rule, which is a babashka-powered analogue to Bazel's genrule
"""

# babashka.bzl
def _bb_genrule_impl(ctx):
    toolchain = ctx.toolchains["//:babashka_toolchain"]
    ctx.actions.run(
        inputs = [ctx.file.script] + ctx.files.data,
        outputs = [ctx.outputs.out],
        executable = toolchain.bb,
        arguments = [
            ctx.file.script.path,
            """{{
            :out-file "{out_file}"
            :data [{data}]
            }}""".format(
                out_file = ctx.outputs.out.path,
                data = " ".join(["\"{}\"".format(data.path) for data in ctx.files.data]),
            ),
        ],
    )

bb_genrule = rule(
    doc = "An alternative to the general genrule which uses babashka as the scripting language",
    implementation = _bb_genrule_impl,
    attrs = {
        "script": attr.label(allow_single_file = [".clj"], mandatory = True),
        "out": attr.output(mandatory = True),
        "data": attr.label_list(allow_files = True),
    },
    toolchains = ["//:babashka_toolchain"],
)
