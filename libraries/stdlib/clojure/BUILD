"""
Builds consumable libraries of static methods.
"""

load("//:tags.bzl", "clojure_tag")
load("//toolchains/clojure:clojure_library.bzl", "clojure_library")
load("//toolchains/clojure:clojure_test.bzl", "clojure_test")

package(default_visibility = ["//visibility:public"])

clojure_library(
    name = "strings",
    srcs = [
        "strings.clj",
    ],
    tags = [clojure_tag],
)

clojure_test(
    name = "strings_test",
    size = "small",
    srcs = ["strings_test.clj"],
    tags = [clojure_tag],
    deps = [":strings"],
)

test_suite(
    name = "small_tests",
    tags = ["small"],
)
