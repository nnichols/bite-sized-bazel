"""
Example usage of our custom rules.
"""

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@stardoc//stardoc:stardoc.bzl", "stardoc")
load(":hello.bzl", "hello")
load(":hello_temp.bzl", "hello_temp")
load(":noop.bzl", "noop_binary")
load(":print.bzl", "print_binary")
load(":product.bzl", "product")

noop_binary(name = "noop")

stardoc(
    name = "noop_binary_docs",
    out = "noop_binary_docs.md",
    input = "noop.bzl",
)

print_binary(
    name = "print",
    tags = [
        "tag1",
        "tag2",
        "tag3",
    ],
)

hello(
    name = "hello_world",
)

hello(
    name = "hello_world_again",
)

alias(
    name = "hello_again",
    actual = ":hello_world_again",
)

hello_temp(
    name = "hello_world_temp",
)

exports_files(
    srcs = ["greeting.json.tpl"],
    visibility = ["//visibility:public"],
)

product(
    name = "two",
    number = 2,
    deps = [":one"],
)

product(
    name = "three",
    number = 3,
    deps = [":one"],
)

product(
    name = "six",
    deps = [
        ":one",
        ":three",
        ":two",
    ],
)

product(
    name = "four",
    number = 2,
    deps = [
        ":two",
    ],
)

product(
    name = "twenty_four",
    deps = [
        ":one",
        ":four",
        ":six",
    ],
)

product(
    name = "five",
    number = 5,
    deps = [":one"],
)

product(
    name = "one_hundred_twenty",
    deps = [
        ":five",
        ":one",
        ":twenty_four",
    ],
)

product(
    name = "one",
    number = 1,
)

bzl_library(
    name = "rules_source",
    srcs = [
        "factors_file.bzl",
        "greeter.bzl",
        "hello.bzl",
        "hello_temp.bzl",
        "json_greeter.bzl",
        "noop.bzl",
        "print.bzl",
        "print_factors.bzl",
        "product.bzl",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//aspects:aspects_source",
        "//providers:providers_source",
    ],
)
