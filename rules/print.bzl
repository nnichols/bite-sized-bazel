"""
A build rule which prints the evaluation context.
"""

def _print_binary_impl(ctx):
    # buildifier: disable=print
    print("Processing target {}".format(ctx.label))

    for _, tag in enumerate(ctx.attr.tags):
        # buildifier: disable=print
        print("  tag = \'{}\'".format(tag))

    # buildifier: disable=print
    print(dir(ctx))

print_binary = rule(
    implementation = _print_binary_impl,
)
