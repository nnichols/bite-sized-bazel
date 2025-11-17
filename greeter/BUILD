"""
Greet people in multiple languages!
"""

load("@rules_java//java:defs.bzl", "java_binary")
load("@rules_python//python:py_binary.bzl", "py_binary")
load("//:tags.bzl", "babashka_tag", "clojure_tag", "java_tag", "python_tag")
load("//rules:greeter.bzl", "greeter")
load("//rules:json_greeter.bzl", "json_greeter")
load("//toolchains/babashka:bb_binary.bzl", "bb_binary")
load("//toolchains/clojure:clojure_binary.bzl", "clojure_binary")
load("//toolchains/clojure:clojure_library.bzl", "clojure_library")

py_binary(
    name = "python",
    srcs = [
        "hello.py",
    ],
    main = "hello.py",
    tags = [python_tag],
    deps = [
        "//libraries/stdlib/python:strings",
    ],
)

py_binary(
    name = "python_json",
    srcs = [
        "hellojson.py",
    ],
    main = "hellojson.py",
    tags = [python_tag],
    deps = [
        "//libraries/stdlib/python:strings",
        "@pypi//json_lineage:pkg",
    ],
)

java_binary(
    name = "java",
    srcs = [
        "Hello.java",
    ],
    main_class = "Hello",
    tags = [java_tag],
    deps = [
        "//libraries/stdlib/java:strings",
    ],
)

java_binary(
    name = "java_json",
    srcs = [
        "HelloJson.java",
    ],
    main_class = "HelloJson",
    tags = [java_tag],
    deps = [
        "//libraries/stdlib/java:strings",
        "@maven//:com_google_code_gson_gson",
    ],
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
    username = "Nick",
)

json_greeter(
    name = "bazel_json",
    username = "Nick",
)

bb_binary(
    name = "babashka",
    src = ":hello.clj",
    tags = [babashka_tag],
)

bb_binary(
    name = "babashka_json",
    src = ":hello_json.clj",
    tags = [babashka_tag],
)

clojure_library(
    name = "clojure_hello_source",
    srcs = ["hello_clojure.clj"],
    tags = [clojure_tag],
)

clojure_binary(
    name = "clojure",
    main = "greeter.hello-clojure",
    tags = [clojure_tag],
    deps = [
        ":clojure_hello_source",
        "//libraries/stdlib/clojure:strings",
    ],
)

clojure_library(
    name = "clojure_hello_json_source",
    srcs = ["hello_clojure_json.clj"],
    tags = [clojure_tag],
    deps = [
        "//libraries/stdlib/clojure:strings",
        "@maven//:cheshire_cheshire",
    ],
)

clojure_binary(
    name = "clojure_json",
    main = "greeter.hello-clojure-json",
    tags = [clojure_tag],
    deps = [
        ":clojure_hello_json_source",
    ],
)
