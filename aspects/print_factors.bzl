"""
Accumulates and prints the factors from attributes and dependencies.
"""

load("//providers:factor-info.bzl", "FactorInfo")

def _factors_impl(_target, ctx):
    factors_list = []

    # Our dependencies have already been factorized
    # We can copy that information to understand our context's prime factors
    for dep in ctx.rule.attr.deps:
        if FactorInfo in dep:
            factors_list.extend(dep[FactorInfo].factors)

    # Directly referencing an attribute which is undeclared by a rule target triggers an Error
    #     The `hasattr` method checks to make sure access is safe
    if hasattr(ctx.rule.attr, "number"):
        # The product tules takes the product of all dependencies, as well as the `number` attribute
        factors_list.append(ctx.rule.attr.number)

    # buildifier: disable=print
    print(ctx.label.name + ": " + str(sorted(factors_list)))

    # Like rules, we need to pass information down to our dependents
    return [FactorInfo(factors = factors_list)]

print_factors = aspect(
    doc = "Accumulates the factors from attributes and dependencies.",
    implementation = _factors_impl,
    attr_aspects = ["deps"],
)
