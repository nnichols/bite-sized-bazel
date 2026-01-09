"""
Loads all of the Rules defined in the `//toolchains/babashka` package to make a convenient Stardoc target.
"""

load("//toolchains/babashka:bb_binary.bzl", _bb_binary_rule = "bb_binary")
load("//toolchains/babashka:bb_genrule.bzl", _bb_genrule_rule = "bb_genrule")
load("//toolchains/babashka:bb_test.bzl", _bb_test_rule = "bb_test")
load("//toolchains/babashka:bb_toolchain.bzl", _bb_toolchain_rule = "bb_toolchain")

bb_binary_rule = _bb_binary_rule
bb_genrule_rule = _bb_genrule_rule
bb_test_rule = _bb_test_rule
bb_toolchain_rule = _bb_toolchain_rule
