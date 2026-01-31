"""
Example usage of our product rules and their factors.
"""

load("//rules:factors_file.bzl", "factors_file")
load("//rules:print_factors.bzl", "print_factors")
load("//rules:product.bzl", "product")

product(
    name = "one",
    number = 1,
)

product(
    name = "two",
    number = 2,
    deps = [
        ":one",
    ],
)

product(
    name = "three",
    number = 3,
    deps = [
        ":one",
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
    name = "five",
    number = 5,
    deps = [
        ":one",
    ],
)

product(
    name = "six",
    deps = [
        ":three",
        ":two",
    ],
)

product(
    name = "seven",
    number = 7,
    deps = [
        ":one",
    ],
)

product(
    name = "eight",
    number = 2,
    deps = [
        ":four",
    ],
)

product(
    name = "nine",
    number = 3,
    deps = [
        ":three",
    ],
)

product(
    name = "ten",
    deps = [
        ":five",
        ":two",
    ],
)

print_factors(
    name = "one_factors",
    deps = [
        ":one",
    ],
)

print_factors(
    name = "eight_factors",
    deps = [
        ":eight",
        ":six",
    ],
)

# NOTE: buildifier automatically sorts `deps` by their label
factors_file(
    name = "factors",
    deps = [
        ":eight",
        ":five",
        ":four",
        ":nine",
        ":one",
        ":seven",
        ":six",
        ":ten",
        ":three",
        ":two",
    ],
)
