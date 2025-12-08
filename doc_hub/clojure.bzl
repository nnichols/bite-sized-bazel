"""
Loads all of the Rules defined in the `//toolchains/clojure` package to make a convenient Stardoc target.
"""

load("//toolchains/clojure:clojure_binary.bzl", _clojure_binary_rule = "clojure_binary")
load("//toolchains/clojure:clojure_library.bzl", _clojure_library_rule = "clojure_library")
load("//toolchains/clojure:clojure_test.bzl", _clojure_test_rule = "clojure_test")
load("//toolchains/clojure:clojure_toolchain.bzl", _clojure_toolchain_rule = "clojure_toolchain")

clojure_binary_rule = _clojure_binary_rule
clojure_library_rule = _clojure_library_rule
clojure_test_rule = _clojure_test_rule
clojure_toolchain_rule = _clojure_toolchain_rule
