"""
A build rule which generates a temp file with a static greeting
"""

def _hello_temp_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = out,
        content = "Hello\n",
    )

hello_temp = rule(
    doc = "Writes a static greeting to a temp file",
    implementation = _hello_temp_impl,
)
