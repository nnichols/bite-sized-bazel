"""
Builds consumable libraries.
"""
load("@rules_python//python:defs.bzl", "py_library", "py_test")

package(default_visibility = ["//visibility:public"])

py_library(
    name = "strings",
    srcs = ["strings.py"],
)

py_test(
    name = "strings_test",
    size = "small",
    deps = [":strings"],
    srcs = ["strings_test.py"]
)
