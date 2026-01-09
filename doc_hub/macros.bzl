"""
Loads all of the macros defined in the `//macros` package to make a convenient Stardoc target.
"""

load("//macros:graphviz.bzl", _graphviz_macro = "graphviz")

graphviz_macro = _graphviz_macro
