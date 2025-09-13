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
    main = "hello.py",
)

java_binary(
    name = "java",
    srcs = [
        "Hello.java",
    ],
    main_class = "Hello",
)
