"""
A central documentation hub for the `.bzl` files we've authored
"""

load("@stardoc//stardoc:stardoc.bzl", "stardoc")

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

filegroup(
    name = "all_docs",
    srcs = [
        ":rules_docs",
        ":babashka_toolchain_docs",
        ":clojure_toolchain_docs",
        ":macros_docs",
    ]
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
