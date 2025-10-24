"""
This is an example build file which creates a named target for multiple files.
"""

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "documentation",
    srcs = glob(
        ["*.md"],
    ),
)

alias(
    name = "docs",
    actual = ":documentation",
)

genrule(
    name = "concat_docs",
    srcs = [
        ":docs",
    ],
    outs = ["concatenated.txt"],
    cmd = "cat $(locations :docs) > $@",
)
