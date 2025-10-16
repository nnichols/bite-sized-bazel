"""
A build rule which does nothing.
"""

def _noop_binary_impl(ctx):
    pass

noop_binary = rule(
    implementation = _noop_binary_impl,
)
