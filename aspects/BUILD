"""
Aspects for communicating information across dependencies.
"""

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

bzl_library(
    name = "aspects_source",
    srcs = [
        "factors.bzl",
        "print_factors.bzl",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//providers:providers_source",
    ],
)
