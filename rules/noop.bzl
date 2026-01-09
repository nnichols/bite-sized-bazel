"""
A build rule which does nothing.
"""

def _noop_binary_impl(_):
    pass

noop_binary = rule(
    doc = "A rule which does and returns nothing",
    implementation = _noop_binary_impl,
)
