"""
Example usage of our custom rules.
"""

load(":hello.bzl", "hello")
load(":hello_temp.bzl", "hello_temp")
load(":noop.bzl", "noop_binary")
load(":print.bzl", "print_binary")
load(":product.bzl", "product")

noop_binary(name = "noop")

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
    name = "twenty_four",
    number = 4,
    deps = [
        ":one",
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
