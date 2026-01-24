"""
Writes the factors of arguments to a JSON file.
"""

load("//aspects:factors.bzl", "factors")
load("//providers:factor-info.bzl", "FactorInfo")

def _factors_file_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".json")

    # We're making a lookup table from full labels to lists of factors
    factors_dict = {}

    for dep in ctx.attr.deps:
        if FactorInfo in dep:
            factors_dict.update({str(dep.label): dep[FactorInfo].factors})

    ctx.actions.write(
        output = out,
        content = json.encode(factors_dict),
    )

    return [DefaultInfo(files = depset([out]))]

factors_file = rule(
    implementation = _factors_file_impl,
    doc = "Writes the list of factors for a product target to a JSON file.",
    attrs = {
        "deps": attr.label_list(
            doc = "The dependencies whose factors should be accumulated.",
            aspects = [factors],
        ),
    },
)
