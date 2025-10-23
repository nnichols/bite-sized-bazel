"""
Builds consumable libraries of static methods.
"""

load("@rules_java//java:defs.bzl", "java_library", "java_test")
load("//:tags.bzl", "java_tag")

package(default_visibility = ["//visibility:public"])

java_library(
    name = "strings",
    srcs = ["Strings.java"],
    tags = [java_tag],
)

java_library(
    name = "string_test_class",
    testonly = True,
    srcs = ["StringsTest.java"],
    tags = [java_tag],
    deps = [
        ":strings",
        "@maven//:junit_junit",
    ],
)

java_test(
    name = "strings_test",
    size = "small",
    tags = [java_tag],
    test_class = "libraries.stdlib.StringsTest",
    runtime_deps = [
        ":string_test_class",
        ":strings",
        "@maven//:junit_junit",
    ],
)

test_suite(
    name = "small_tests",
    tags = ["small"],
)
