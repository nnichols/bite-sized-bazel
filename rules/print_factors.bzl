"""
Prints the factors of arguments of dependencies.
"""

load("//aspects:factors.bzl", "factors")
load("//providers:factor-info.bzl", "FactorInfo")

def _print_factors_impl(ctx):
    for dep in ctx.attr.deps:
        # buildifier: disable=print
        print(dep.label.name + ": " + str(dep[FactorInfo].factors))

print_factors = rule(
    implementation = _print_factors_impl,
    doc = "Prints the list of factors for a product target.",
    attrs = {
        "deps": attr.label_list(
            doc = "The dependencies whose factors should be accumulated.",
            aspects = [factors],
        ),
    },
)
