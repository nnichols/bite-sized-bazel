"""
Example usage of our custom babashka toolchain.
"""

load("//toolchains/babashka:bb_binary.bzl", "bb_binary")
load("//toolchains/babashka:bb_genrule.bzl", "bb_genrule")
load("//toolchains/babashka:bb_test.bzl", "bb_test")
load("//toolchains/babashka:bb_toolchain.bzl", "bb_toolchain")

bb_genrule(
    name = "pwd",
    out = "pwd.edn",
    script = ":pwd.clj",
)

bb_genrule(
    name = "reader",
    out = "results.edn",
    data = [
        ":pwd.edn",
    ],
    script = ":reader.clj",
)

bb_binary(
    name = "hello",
    src = ":hello.clj",
)

bb_test(
    name = "example_test",
    src = ":example_test.clj",
)

toolchain_type(
    name = "babashka_toolchain",
    visibility = ["//visibility:public"],
)

bb_toolchain(
    name = "bb_osx",
    bb = "@babashka_osx//:bb",
)

toolchain(
    name = "bb_osx_toolchain",
    exec_compatible_with = [
        "@platforms//os:macos",
    ],
    toolchain = ":bb_osx",
    toolchain_type = ":babashka_toolchain",
)

bb_toolchain(
    name = "bb_linux",
    bb = "@babashka_linux//:bb",
)

toolchain(
    name = "bb_linux_toolchain",
    exec_compatible_with = [
        "@platforms//os:linux",
    ],
    toolchain = ":bb_linux",
    toolchain_type = ":babashka_toolchain",
)

bb_toolchain(
    name = "bb_windows",
    bb = "@babashka_windows//:bb",
)

toolchain(
    name = "bb_windows_toolchain",
    exec_compatible_with = [
        "@platforms//os:windows",
    ],
    toolchain = ":bb_windows",
    toolchain_type = ":babashka_toolchain",
)
