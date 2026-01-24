"""
Generates the product of arguments of dependencies.
"""

load("//providers:number-info.bzl", "NumberInfo")

def _product_impl(ctx):
    result = ctx.attr.number
    for dep in ctx.attr.deps:
        if NumberInfo in dep:
            result = result * dep[NumberInfo].number
    ctx.actions.write(output = ctx.outputs.out, content = str(result))

    # Return the provider with result, visible to other rules.
    return [NumberInfo(number = result)]

_product = rule(
    doc = "Produces the product of all dependencies as a NumberInfo",
    implementation = _product_impl,
    attrs = {
        "number": attr.int(default = 1, doc = "The value all dependencies will be multiplied by. Defaults to 1."),
        "deps": attr.label_list(doc = "A list of NumberInfo provider dependencies to multiply the number by."),
        "out": attr.output(doc = "The output location the result should be written to."),
    },
)

def product(**kwargs):
    _product(out = "{name}.product".format(**kwargs), **kwargs)
