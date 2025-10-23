"""
Builds consumable libraries.
"""

load("@rules_python//python:defs.bzl", "py_library", "py_test")
load("//:tags.bzl", "python_tag")

package(default_visibility = ["//visibility:public"])

py_library(
    name = "strings",
    srcs = ["strings.py"],
    tags = [python_tag],
)

py_test(
    name = "strings_test",
    size = "small",
    srcs = ["strings_test.py"],
    tags = [python_tag],
    deps = [":strings"],
)

test_suite(
    name = "small_tests",
    tags = ["small"],
)
