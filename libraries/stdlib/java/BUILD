"""
Builds consumable libraries of static methods.
"""
load("@rules_java//java:defs.bzl", "java_library", "java_test")

package(default_visibility = ["//visibility:public"])

java_library(
    name = "strings",
    srcs = ["Strings.java"]
)

java_library(
    name = "string_test_class",
    deps = [
        ":strings",
        "@maven//:junit_junit"
    ],
    testonly = True,
    srcs = ["StringsTest.java"],
)

java_test(
    name = "strings_test",
    size = "small",
    runtime_deps = [
        ":strings",
        ":string_test_class",
        "@maven//:junit_junit",
    ],
    test_class = "libraries.stdlib.StringsTest"
)
