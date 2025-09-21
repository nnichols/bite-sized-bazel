"""
Greet people in multiple languages!
"""

load("@rules_java//java:defs.bzl", "java_binary")
load("@rules_python//python:py_binary.bzl", "py_binary")

py_binary(
    name = "python",
    srcs = [
        "hello.py",
    ],
    deps = [
        "//libraries/stdlib/python:strings",
    ],
    main = "hello.py",
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
)
