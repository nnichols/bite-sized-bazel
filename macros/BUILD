"""
Example usage of our custom macros.
"""

load(":graphviz.bzl", "graphviz")

exports_files(
    srcs = [
        "basic_build_unfactored.gv",
        "filegroup_deps.gv",
    ],
)

genrule(
    name = "basic_build_png",
    srcs = [
        "basic_build_unfactored.gv",
    ],
    outs = ["basic_build_png.png"],
    cmd = "dot -Tpng < $(locations :basic_build_unfactored.gv) > $@ ",
)

genrule(
    name = "filegroup_png",
    srcs = [
        "filegroup_deps.gv",
    ],
    outs = ["filegroup_png.png"],
    cmd = "dot -Tpng < $(locations :filegroup_deps.gv) > $@ ",
)

graphviz(
    name = "basic_build_unfactored",
    src = "basic_build_unfactored.gv",
)

graphviz(
    name = "filegroup_deps",
    src = "filegroup_deps.gv",
)

filegroup(
    name = "all_output",
    srcs = [
        ":basic_build_unfactored_filegroup",
        ":filegroup_deps_filegroup",
    ],
)
