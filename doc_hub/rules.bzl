"""
Loads all of the Rules defined in the `//rules` package to make a convenient Stardoc target.
"""

load("//rules:greeter.bzl", _greeter_rule = "greeter")
load("//rules:hello.bzl", _hello_rule = "hello")
load("//rules:hello_temp.bzl", _hello_tmp_rule = "hello_temp")
load("//rules:json_greeter.bzl", _json_greeter_rule = "json_greeter")
load("//rules:noop.bzl", _noop_binary_rule = "noop_binary")
load("//rules:print.bzl", _print_binary_rule = "print_binary")
load("//rules:product.bzl", _product_rule = "product")

greeter_rule = _greeter_rule
hello_rule = _hello_rule
hello_temp_rule = _hello_tmp_rule
json_greeter_rule = _json_greeter_rule
noop_binary_rule = _noop_binary_rule
print_binary_rule = _print_binary_rule
product_rule = _product_rule
