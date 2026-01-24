"""
Loads all of the Providers defined in the `//providers` package to make a convenient Stardoc target.
"""

load("//providers:factor-info.bzl", _FactorInfo = "FactorInfo")
load("//providers:number-info.bzl", _NumberInfo = "NumberInfo")

FactorInfo = _FactorInfo
NumberInfo = _NumberInfo
