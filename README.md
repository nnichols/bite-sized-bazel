# Bite-Sized Bazel

This repository is an educational, narrative guide to creating a new Bazel project from scratch.
The wiki for this repository contains a step-by-step guide that iteratively builds up a Bazel project in bite-sized pieces.
We'll cover the basics of Bazel, how to set up your workspace, how to define and build your own targets, and more.

## Disclaimers

This is intended as an educational resource, not a production-ready project.
For the sake of narrative consistency, we'll be pinning versions of most dependencies and Bazel itself.
Over time, these will naturally fall out of date- please refer to the official documentation for the most current information.

Furthermore, this guide is not exhaustive.
Bazel is a powerful tool that can be used in many different ways, and enables developers to build their own tooling, workflows, and more.
This guide is intended to help understand the fundamentals of Bazel, not to prescribe a particular toolchain, workflow, or process.

### Pinned Versions

Explicitly pinned tools will be documented below:

- [**Bazel**](https://bazel.build/): 8.3.1
- [**rules_java**](https://github.com/bazelbuild/rules_java/tree/8.12.0): 8.12.0
- [**OpenJDK**](https://openjdk.org/projects/jdk/21/): 21.0.8
- [**Python**](https://www.python.org/downloads/release/python-3137/): 3.13.7

### Unpinned Tools

- [**Graphviz**](https://graphviz.org/): Used to visualize dependency graphs as images.
- [**jEnv**](https://github.com/jenv/jenv): Java version manager.
- [**pyenv**](https://github.com/pyenv/pyenv): Python version manager.

## Lessons

The lessons can be found in the [wiki of this repository.](https://github.com/nnichols/bite-sized-bazel/wiki)
They progressively build up the repository from an initial, empty commit to the current state.

- [Lesson 1: Installing Bazel](https://github.com/nnichols/bite-sized-bazel/wiki/Lesson-1:-Installing-Bazel)
  - Installs Bazel to your machine and sets up the repository as a Bazel project
- [Lesson 2: Creating Packages](https://github.com/nnichols/bite-sized-bazel/wiki/Lesson-2:-Creating-Packages)
  - Creates a few basic packages, links them together, and explores the dependency graph

## Licensing

This repository, the documentation, and all included code is licensed under the MIT License.
That said, it was primarily created for educational purposes, so please use accordingly.
See the [LICENSE](LICENSE) file for more details.
