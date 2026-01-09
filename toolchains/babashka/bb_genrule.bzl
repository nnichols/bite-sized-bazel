"""
Defines the bb_genrule rule, which is a babashka-powered analogue to Bazel's genrule
"""

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
        "script": attr.label(allow_single_file = [".clj"], mandatory = True, doc = "The `.clj` file containing the source code of the script to execute."),
        "out": attr.output(mandatory = True, doc = "The output location for the script's results. Passed into babashka as `out-file`"),
        "data": attr.label_list(allow_files = True, doc = "A list of artifact labels passed to the babashka script. Passed into babashka as `data`"),
    },
    toolchains = ["//:babashka_toolchain"],
)
