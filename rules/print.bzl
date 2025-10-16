"""
A build rule which prints the evaluation context.
"""

def _print_binary_impl(ctx):
    print("Processing target {}".format(ctx.label))

    for _index, tag in enumerate(ctx.attr.tags):
        print("  tag = \'{}\'".format(tag))

    print(dir(ctx))

print_binary = rule(
    implementation = _print_binary_impl,
)
