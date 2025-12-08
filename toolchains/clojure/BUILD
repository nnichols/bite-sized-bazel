"""
Example usage of our custom clojure toolchain.
"""

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("//:tags.bzl", "clojure_tag")
load("//toolchains/clojure:clojure_binary.bzl", "clojure_binary")
load("//toolchains/clojure:clojure_library.bzl", "clojure_library")
load("//toolchains/clojure:clojure_test.bzl", "clojure_test")
load("//toolchains/clojure:clojure_toolchain.bzl", "clojure_toolchain")

toolchain_type(
    name = "clojure_toolchain",
    visibility = ["//visibility:public"],
)

clojure_toolchain(
    name = "jvm_clojure_toolchain",
    classpath = [
        "@clojure_core//jar:jar",
        "@clojure_spec_alpha//jar:jar",
        "@clojure_core_specs//jar:jar",
        "@clojure_tools_cli//jar:jar",
    ],
)

toolchain(
    name = "clojure_jvm_toolchain",
    toolchain = ":jvm_clojure_toolchain",
    toolchain_type = "clojure_toolchain",
)

clojure_library(
    name = "pwd_source",
    srcs = [
        "pwd.clj",
    ],
    tags = [clojure_tag],
)

clojure_binary(
    name = "pwd",
    main = "toolchains.clojure.pwd",
    tags = [clojure_tag],
    deps = [":pwd_source"],
)

clojure_test(
    name = "example-test",
    size = "small",
    srcs = ["example_test.clj"],
    tags = [clojure_tag],
)

bzl_library(
    name = "clojure_rules_source",
    srcs = [
        "clojure_binary.bzl",
        "clojure_library.bzl",
        "clojure_test.bzl",
        "clojure_toolchain.bzl",
    ],
    visibility = ["//visibility:public"],
)
