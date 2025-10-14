"""
Generates the product of arguments of dependencies.
"""

NumberInfo = provider(doc = "", fields = ["number"])

def _product_impl(ctx):
    result = ctx.attr.number
    for dep in ctx.attr.deps:
        if NumberInfo in dep:
            result = result * dep[NumberInfo].number
    ctx.actions.write(output = ctx.outputs.out, content = str(result))

    # Return the provider with result, visible to other rules.
    return [NumberInfo(number = result)]

_product = rule(
    implementation = _product_impl,
    attrs = {
        "number": attr.int(default = 1),
        "deps": attr.label_list(),
        "out": attr.output(),
    },
)

def product(**kwargs):
    _product(out = "{name}.product".format(**kwargs), **kwargs)
