"""
Top-level repository files Bazel needs to access
"""
load("@rules_python//python:pip.bzl", "compile_pip_requirements")

# The file where rules_jvm_external stores how transitive dependencies were resolved
exports_files(
    srcs = ["maven_install.json"],
    visibility = ["//visibility:public"],
)

# The source requirements file from which the lockfile will be generated
compile_pip_requirements(
    name = "python_requirements",
    src = "requirements.in",
    requirements_txt = "requirements_lock.txt",
)
