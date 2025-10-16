"""
Greet people in multiple languages!
"""

load("@rules_java//java:defs.bzl", "java_binary")
load("@rules_python//python:py_binary.bzl", "py_binary")
load("//:tags.bzl", "java_tag", "python_tag")
load("//rules:greeter.bzl", "greeter")
load("//rules:json_greeter.bzl", "json_greeter")

py_binary(
    name = "python",
    srcs = [
        "hello.py",
    ],
    deps = [
        "//libraries/stdlib/python:strings",
    ],
    main = "hello.py",
    tags = [python_tag],
)

py_binary(
    name = "python_json",
    srcs = [
        "hellojson.py",
    ],
    deps = [
        "//libraries/stdlib/python:strings",
        "@pypi//json_lineage:pkg"
    ],
    main = "hellojson.py",
    tags = [python_tag],
)

java_binary(
    name = "java",
    srcs = [
        "Hello.java",
    ],
    deps = [
        "//libraries/stdlib/java:strings",
    ],
    main_class = "Hello",
    tags = [java_tag],
)

java_binary(
    name = "java_json",
    srcs = [
        "HelloJson.java",
    ],
    deps = [
        "//libraries/stdlib/java:strings",
         "@maven//:com_google_code_gson_gson",
    ],
    main_class = "HelloJson",
    tags = [java_tag],
)

genquery(
    name = "java_json_deps",
    expression = "deps(//greeter:java_json)",
    scope = [":java_json"],
    tags = [java_tag],
)

genquery(
    name = "python_json_deps",
    expression = "deps(//greeter:python_json)",
    scope = [":python_json"],
    tags = [python_tag],
)

greeter(
    name = "bazel",
    username = "Nick"
)

json_greeter(
    name = "bazel_json",
    username = "Nick"
)
