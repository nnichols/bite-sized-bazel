"""
Provides the correct version of babashka to our bb rules so they can execute across systems
"""

def _bb_toolchain(ctx):
    return platform_common.ToolchainInfo(
        bb = ctx.executable.bb,
    )

bb_toolchain = rule(
    doc = "Provides the correct architecture-dependent version of babashka",
    implementation = _bb_toolchain,
    attrs = {
        "bb": attr.label(
            doc = "The babashka binary which will be used to execute programs.",
            executable = True,
            allow_single_file = True,
            cfg = "exec",
        ),
    },
)
