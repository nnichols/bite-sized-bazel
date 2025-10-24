"""
A build rule which does nothing.
"""

def _noop_binary_impl(_):
    pass

noop_binary = rule(
    implementation = _noop_binary_impl,
)
