"""
A build rule which generates a file with a static greeting
"""

def _hello_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = out,
        content = "Hello\n",
    )

    return [DefaultInfo(files = depset([out]))]

hello = rule(
    doc = "Writes a static greeting to a file",
    implementation = _hello_impl,
)
