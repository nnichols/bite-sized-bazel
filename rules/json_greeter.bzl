"""
A build rule which generates a JSON file with a greeting to a specified user.
"""

def _json_greeter_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".json")
    ctx.actions.expand_template(
        output = out,
        template = ctx.file._template,
        substitutions = {"%{username}": ctx.attr.username},
    )

    return [DefaultInfo(files = depset([out]))]

json_greeter = rule(
    implementation = _json_greeter_impl,
    attrs = {
        "username": attr.string(
            mandatory = True,
        ),
        "_template": attr.label(
            allow_single_file = True,
            default = "greeting.json.tpl",
        ),
    },
)
