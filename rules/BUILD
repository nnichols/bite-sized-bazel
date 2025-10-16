"""
Example usage of our custom rules.
"""

load(":noop.bzl", "noop_binary")
load(":print.bzl", "print_binary")
load(":hello.bzl", "hello")
load(":hello_temp.bzl", "hello_temp")
load(":product.bzl", "product")

noop_binary(name = "noop")

print_binary(
    name = "print",
    tags = ["tag1", "tag2", "tag3"],
)

hello(
    name = "hello_world"
)

hello(
    name = "hello_world_again"
)

alias(
    name = "hello_again",
    actual = ":hello_world_again"
)

hello_temp(
    name = "hello_world_temp"
)

exports_files(
    srcs = ["greeting.json.tpl"],
    visibility = ["//visibility:public"],
)

product(
    name = "two",
    number = 2
)

product(
    name = "three",
    number = 3
)

product(
    name = "six",
    deps = [
        ":two",
        ":three"
    ]
)

product(
    name = "twenty_four",
    number = 4,
    deps = [
        ":six"
    ]
)
