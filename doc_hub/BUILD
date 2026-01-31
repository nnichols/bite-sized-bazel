"""
A central documentation hub for the `.bzl` files we've authored
"""

load("@stardoc//stardoc:stardoc.bzl", "stardoc")
load("//toolchains/clojure:clojure_binary.bzl", "clojure_binary")
load("//toolchains/clojure:clojure_library.bzl", "clojure_library")

stardoc(
    name = "rules_docs",
    out = "rules_docs.md",
    input = "rules.bzl",
    symbol_names = [
        "greeter_rule",
        "hello_rule",
        "hello_temp_rule",
        "json_greeter_rule",
        "noop_binary_rule",
        "print_binary_rule",
        "product_rule",
    ],
    deps = ["//rules:rules_source"],
)

stardoc(
    name = "babashka_toolchain_docs",
    out = "babashka_toolchain_docs.md",
    input = "babashka.bzl",
    symbol_names = [
        "bb_binary_rule",
        "bb_genrule_rule",
        "bb_test_rule",
        "bb_toolchain_rule",
    ],
    deps = ["//toolchains/babashka:babashka_rules_source"],
)

stardoc(
    name = "clojure_toolchain_docs",
    out = "clojure_toolchain_docs.md",
    input = "clojure.bzl",
    symbol_names = [
        "clojure_binary_rule",
        "clojure_library_rule",
        "clojure_test_rule",
        "clojure_toolchain_rule",
    ],
    deps = ["//toolchains/clojure:clojure_rules_source"],
)

stardoc(
    name = "macros_docs",
    out = "macros_docs.md",
    input = "macros.bzl",
    symbol_names = [
        "graphviz_macro",
    ],
    deps = ["//macros:macros_source"],
)

stardoc(
    name = "providers_docs",
    out = "providers_docs.md",
    input = "providers.bzl",
    symbol_names = [
        "FactorInfo",
        "NumberInfo",
    ],
    deps = ["//providers:providers_source"],
)

stardoc(
    name = "aspects_docs",
    out = "aspects_docs.md",
    input = "aspects.bzl",
    symbol_names = [
        "print_factors",
        "factors",
    ],
    deps = ["//aspects:aspects_source"],
)

filegroup(
    name = "all_docs",
    srcs = [
        ":aspects_docs",
        ":babashka_toolchain_docs",
        ":clojure_toolchain_docs",
        ":macros_docs",
        ":providers_docs",
        ":rules_docs",
    ],
)

genrule(
    name = "concated_docs",
    srcs = [
        ":all_docs",
    ],
    outs = ["build_api.md"],
    cmd = "cat $(locations :all_docs) > $@",
    visibility = ["//visibility:public"],
)

clojure_library(
    name = "copy",
    srcs = [
        "copy.clj",
    ],
)

clojure_binary(
    name = "copy_api_documentation",
    arguments = [
        "--output",
        "./generated/api-documentation.md",
    ],
    data = [
        ":concated_docs",
    ],
    execute_in_workspace = True,
    main = "doc-hub.copy",
    deps = [
        ":copy",
    ],
)

clojure_binary(
    name = "copy_api_documentation_local",
    arguments = [
        "--output",
        "./generated/api-documentation.md",
    ],
    data = [
        ":concated_docs",
    ],
    execute_in_workspace = False,
    main = "doc-hub.copy",
    deps = [
        ":copy",
    ],
)
