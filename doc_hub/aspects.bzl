"""
Loads all of the Aspects defined in the `//aspects` package to make a convenient Stardoc target.
"""

load("//aspects:factors.bzl", _factors = "factors")
load("//aspects:print_factors.bzl", _print_factors = "print_factors")

factors = _factors
print_factors = _print_factors
