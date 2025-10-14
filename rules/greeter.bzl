"""
A build rule which generates a file with a greeting to a specified user.
"""

def _greeter_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = out,
        content = "Hello, {}\n".format(ctx.attr.username),
    )

    return [DefaultInfo(files = depset([out]))]

greeter = rule(
    implementation = _greeter_impl,
    attrs = {
        "username": attr.string(),
    },
)
