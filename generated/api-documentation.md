<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Loads all of the Aspects defined in the `//aspects` package to make a convenient Stardoc target.

<a id="factors"></a>

## factors

<pre>
load("@bite-sized-bazel//doc_hub:aspects.bzl", "factors")

factors()
</pre>

Accumulates the factors from attributes and dependencies.

**ASPECT ATTRIBUTES**


| Name | Type |
| :------------- | :------------- |
| deps| String |


**ATTRIBUTES**



<a id="print_factors"></a>

## print_factors

<pre>
load("@bite-sized-bazel//doc_hub:aspects.bzl", "print_factors")

print_factors()
</pre>

Accumulates the factors from attributes and dependencies.

**ASPECT ATTRIBUTES**


| Name | Type |
| :------------- | :------------- |
| deps| String |


**ATTRIBUTES**



<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Loads all of the Rules defined in the `//toolchains/babashka` package to make a convenient Stardoc target.

<a id="bb_binary_rule"></a>

## bb_binary_rule

<pre>
load("@bite-sized-bazel//doc_hub:babashka.bzl", "bb_binary_rule")

bb_binary_rule(<a href="#bb_binary_rule-name">name</a>, <a href="#bb_binary_rule-src">src</a>, <a href="#bb_binary_rule-arguments">arguments</a>)
</pre>

Executes a babashka script

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="bb_binary_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="bb_binary_rule-src"></a>src |  The `.clj` file containing the source code of the script to execute.   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |
| <a id="bb_binary_rule-arguments"></a>arguments |  A list of string arguments which will be provided in-order to the script.   | List of strings | optional |  `[]`  |


<a id="bb_genrule_rule"></a>

## bb_genrule_rule

<pre>
load("@bite-sized-bazel//doc_hub:babashka.bzl", "bb_genrule_rule")

bb_genrule_rule(<a href="#bb_genrule_rule-name">name</a>, <a href="#bb_genrule_rule-data">data</a>, <a href="#bb_genrule_rule-out">out</a>, <a href="#bb_genrule_rule-script">script</a>)
</pre>

An alternative to the general genrule which uses babashka as the scripting language

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="bb_genrule_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="bb_genrule_rule-data"></a>data |  A list of artifact labels passed to the babashka script. Passed into babashka as `data`   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="bb_genrule_rule-out"></a>out |  The output location for the script's results. Passed into babashka as `out-file`   | <a href="https://bazel.build/concepts/labels">Label</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | required |  |
| <a id="bb_genrule_rule-script"></a>script |  The `.clj` file containing the source code of the script to execute.   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |


<a id="bb_test_rule"></a>

## bb_test_rule

<pre>
load("@bite-sized-bazel//doc_hub:babashka.bzl", "bb_test_rule")

bb_test_rule(<a href="#bb_test_rule-name">name</a>, <a href="#bb_test_rule-src">src</a>, <a href="#bb_test_rule-arguments">arguments</a>)
</pre>

Executes a babashka script as a test

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="bb_test_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="bb_test_rule-src"></a>src |  The `.clj` file containing the source code of the script to execute.   | <a href="https://bazel.build/concepts/labels">Label</a> | required |  |
| <a id="bb_test_rule-arguments"></a>arguments |  A list of string arguments which will be provided in-order to the script.   | List of strings | optional |  `[]`  |


<a id="bb_toolchain_rule"></a>

## bb_toolchain_rule

<pre>
load("@bite-sized-bazel//doc_hub:babashka.bzl", "bb_toolchain_rule")

bb_toolchain_rule(<a href="#bb_toolchain_rule-name">name</a>, <a href="#bb_toolchain_rule-bb">bb</a>)
</pre>

Provides the correct architecture-dependent version of babashka

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="bb_toolchain_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="bb_toolchain_rule-bb"></a>bb |  The babashka binary which will be used to execute programs.   | <a href="https://bazel.build/concepts/labels">Label</a> | optional |  `None`  |


<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Loads all of the Rules defined in the `//toolchains/clojure` package to make a convenient Stardoc target.

<a id="clojure_binary_rule"></a>

## clojure_binary_rule

<pre>
load("@bite-sized-bazel//doc_hub:clojure.bzl", "clojure_binary_rule")

clojure_binary_rule(<a href="#clojure_binary_rule-name">name</a>, <a href="#clojure_binary_rule-deps">deps</a>, <a href="#clojure_binary_rule-data">data</a>, <a href="#clojure_binary_rule-arguments">arguments</a>, <a href="#clojure_binary_rule-execute_in_workspace">execute_in_workspace</a>, <a href="#clojure_binary_rule-main">main</a>)
</pre>

Executes a clojure program as a runnable script

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="clojure_binary_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="clojure_binary_rule-deps"></a>deps |  Libraries to link as dependencies of this binary.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="clojure_binary_rule-data"></a>data |  Static data dependencies required at runtime   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="clojure_binary_rule-arguments"></a>arguments |  A list of string arguments to pass to our script.   | List of strings | optional |  `[]`  |
| <a id="clojure_binary_rule-execute_in_workspace"></a>execute_in_workspace |  A boolean that determines if the script should execute in the workspace or the execRoot.   | Boolean | optional |  `False`  |
| <a id="clojure_binary_rule-main"></a>main |  The namespace whose -main function is the target for execution.   | String | required |  |


<a id="clojure_library_rule"></a>

## clojure_library_rule

<pre>
load("@bite-sized-bazel//doc_hub:clojure.bzl", "clojure_library_rule")

clojure_library_rule(<a href="#clojure_library_rule-name">name</a>, <a href="#clojure_library_rule-deps">deps</a>, <a href="#clojure_library_rule-srcs">srcs</a>, <a href="#clojure_library_rule-data">data</a>)
</pre>

Builds a JAR containing the sources with the paths corresponding to namespaces.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="clojure_library_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="clojure_library_rule-deps"></a>deps |  Libraries used as dependencies of this library.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="clojure_library_rule-srcs"></a>srcs |  Clojure source code files.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="clojure_library_rule-data"></a>data |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |


<a id="clojure_test_rule"></a>

## clojure_test_rule

<pre>
load("@bite-sized-bazel//doc_hub:clojure.bzl", "clojure_test_rule")

clojure_test_rule(<a href="#clojure_test_rule-name">name</a>, <a href="#clojure_test_rule-deps">deps</a>, <a href="#clojure_test_rule-srcs">srcs</a>, <a href="#clojure_test_rule-data">data</a>)
</pre>

Runs clojure.test against the source files.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="clojure_test_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="clojure_test_rule-deps"></a>deps |  Libraries containing required test-time dependencies.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |
| <a id="clojure_test_rule-srcs"></a>srcs |  clojure source files with tests.   | <a href="https://bazel.build/concepts/labels">List of labels</a> | required |  |
| <a id="clojure_test_rule-data"></a>data |  -   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |


<a id="clojure_toolchain_rule"></a>

## clojure_toolchain_rule

<pre>
load("@bite-sized-bazel//doc_hub:clojure.bzl", "clojure_toolchain_rule")

clojure_toolchain_rule(<a href="#clojure_toolchain_rule-name">name</a>, <a href="#clojure_toolchain_rule-classpath">classpath</a>)
</pre>

Provides the dependencies necessary to run JVM clojure

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="clojure_toolchain_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="clojure_toolchain_rule-classpath"></a>classpath |  A list of JavaInfo dependencies which will be implicitly loaded into consuming classpaths. Must contain clojure.jar for the compiler   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `[]`  |


<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Loads all of the macros defined in the `//macros` package to make a convenient Stardoc target.

<a id="graphviz_macro"></a>

## graphviz_macro

<pre>
load("@bite-sized-bazel//doc_hub:macros.bzl", "graphviz_macro")

graphviz_macro(*, <a href="#graphviz_macro-name">name</a>, <a href="#graphviz_macro-src">src</a>, <a href="#graphviz_macro-cmd_bash">cmd_bash</a>, <a href="#graphviz_macro-cmd_bat">cmd_bat</a>, <a href="#graphviz_macro-cmd_ps">cmd_ps</a>, <a href="#graphviz_macro-compatible_with">compatible_with</a>, <a href="#graphviz_macro-deprecation">deprecation</a>, <a href="#graphviz_macro-distribs">distribs</a>,
               <a href="#graphviz_macro-exec_compatible_with">exec_compatible_with</a>, <a href="#graphviz_macro-exec_properties">exec_properties</a>, <a href="#graphviz_macro-executable">executable</a>, <a href="#graphviz_macro-features">features</a>, <a href="#graphviz_macro-heuristic_label_expansion">heuristic_label_expansion</a>,
               <a href="#graphviz_macro-licenses">licenses</a>, <a href="#graphviz_macro-local">local</a>, <a href="#graphviz_macro-message">message</a>, <a href="#graphviz_macro-output_licenses">output_licenses</a>, <a href="#graphviz_macro-output_to_bindir">output_to_bindir</a>, <a href="#graphviz_macro-package_metadata">package_metadata</a>,
               <a href="#graphviz_macro-restricted_to">restricted_to</a>, <a href="#graphviz_macro-stamp">stamp</a>, <a href="#graphviz_macro-tags">tags</a>, <a href="#graphviz_macro-target_compatible_with">target_compatible_with</a>, <a href="#graphviz_macro-testonly">testonly</a>, <a href="#graphviz_macro-toolchains">toolchains</a>, <a href="#graphviz_macro-tools">tools</a>,
               <a href="#graphviz_macro-visibility">visibility</a>)
</pre>

Create a .png from the source .gv file

The generated file name will share the same name as the input, but will have a different extension.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="graphviz_macro-name"></a>name |  A unique name for this macro instance. Normally, this is also the name for the macro's main or only target. The names of any other targets that this macro might create will be this name with a string suffix.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="graphviz_macro-src"></a>src |  Graph Files   | <a href="https://bazel.build/concepts/labels">Label</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-cmd_bash"></a>cmd_bash |  Inherited rule attribute   | String | optional |  `None`  |
| <a id="graphviz_macro-cmd_bat"></a>cmd_bat |  Inherited rule attribute   | String | optional |  `None`  |
| <a id="graphviz_macro-cmd_ps"></a>cmd_ps |  Inherited rule attribute   | String | optional |  `None`  |
| <a id="graphviz_macro-compatible_with"></a>compatible_with |  <a href="https://bazel.build/reference/be/common-definitions#common.compatible_with">Inherited rule attribute</a>   | <a href="https://bazel.build/concepts/labels">List of labels</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-deprecation"></a>deprecation |  <a href="https://bazel.build/reference/be/common-definitions#common.deprecation">Inherited rule attribute</a>   | String; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-distribs"></a>distribs |  <a href="https://bazel.build/reference/be/common-definitions#common.distribs">Inherited rule attribute</a>   | List of strings; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-exec_compatible_with"></a>exec_compatible_with |  <a href="https://bazel.build/reference/be/common-definitions#common.exec_compatible_with">Inherited rule attribute</a>   | <a href="https://bazel.build/concepts/labels">List of labels</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-exec_properties"></a>exec_properties |  <a href="https://bazel.build/reference/be/common-definitions#common.exec_properties">Inherited rule attribute</a>   | <a href="https://bazel.build/rules/lib/dict">Dictionary: String -> String</a> | optional |  `None`  |
| <a id="graphviz_macro-executable"></a>executable |  Inherited rule attribute   | Boolean; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-features"></a>features |  <a href="https://bazel.build/reference/be/common-definitions#common.features">Inherited rule attribute</a>   | List of strings | optional |  `None`  |
| <a id="graphviz_macro-heuristic_label_expansion"></a>heuristic_label_expansion |  Inherited rule attribute   | Boolean | optional |  `None`  |
| <a id="graphviz_macro-licenses"></a>licenses |  Inherited rule attribute   | List of strings; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-local"></a>local |  <a href="https://bazel.build/reference/be/common-definitions#test.local">Inherited rule attribute</a>   | Boolean | optional |  `None`  |
| <a id="graphviz_macro-message"></a>message |  Inherited rule attribute   | String | optional |  `None`  |
| <a id="graphviz_macro-output_licenses"></a>output_licenses |  <a href="https://bazel.build/reference/be/common-definitions#binary.output_licenses">Inherited rule attribute</a>   | List of strings | optional |  `None`  |
| <a id="graphviz_macro-output_to_bindir"></a>output_to_bindir |  Inherited rule attribute   | Boolean; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-package_metadata"></a>package_metadata |  <a href="https://bazel.build/reference/be/common-definitions#common.package_metadata">Inherited rule attribute</a>   | <a href="https://bazel.build/concepts/labels">List of labels</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-restricted_to"></a>restricted_to |  <a href="https://bazel.build/reference/be/common-definitions#common.restricted_to">Inherited rule attribute</a>   | <a href="https://bazel.build/concepts/labels">List of labels</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-stamp"></a>stamp |  Inherited rule attribute   | Integer | optional |  `None`  |
| <a id="graphviz_macro-tags"></a>tags |  <a href="https://bazel.build/reference/be/common-definitions#common.tags">Inherited rule attribute</a>   | List of strings; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-target_compatible_with"></a>target_compatible_with |  <a href="https://bazel.build/reference/be/common-definitions#common.target_compatible_with">Inherited rule attribute</a>   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `None`  |
| <a id="graphviz_macro-testonly"></a>testonly |  <a href="https://bazel.build/reference/be/common-definitions#common.testonly">Inherited rule attribute</a>   | Boolean; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-toolchains"></a>toolchains |  <a href="https://bazel.build/reference/be/common-definitions#common.toolchains">Inherited rule attribute</a>   | <a href="https://bazel.build/concepts/labels">List of labels</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  `None`  |
| <a id="graphviz_macro-tools"></a>tools |  Inherited rule attribute   | <a href="https://bazel.build/concepts/labels">List of labels</a> | optional |  `None`  |
| <a id="graphviz_macro-visibility"></a>visibility |  The visibility to be passed to this macro's exported targets. It always implicitly includes the location where this macro is instantiated, so this attribute only needs to be explicitly set if you want the macro's targets to be additionally visible somewhere else.   | <a href="https://bazel.build/concepts/labels">List of labels</a>; <a href="https://bazel.build/reference/be/common-definitions#configurable-attributes">nonconfigurable</a> | optional |  |


<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Loads all of the Providers defined in the `//providers` package to make a convenient Stardoc target.

<a id="FactorInfo"></a>

## FactorInfo

<pre>
load("@bite-sized-bazel//doc_hub:providers.bzl", "FactorInfo")

FactorInfo(<a href="#FactorInfo-factors">factors</a>)
</pre>

Stores the factors for dependents

**FIELDS**

| Name  | Description |
| :------------- | :------------- |
| <a id="FactorInfo-factors"></a>factors |  The list of numeric factors of the product    |


<a id="NumberInfo"></a>

## NumberInfo

<pre>
load("@bite-sized-bazel//doc_hub:providers.bzl", "NumberInfo")

NumberInfo(<a href="#NumberInfo-number">number</a>)
</pre>

Stores the numeric value for dependents

**FIELDS**

| Name  | Description |
| :------------- | :------------- |
| <a id="NumberInfo-number"></a>number |  The number to communicate    |


<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Loads all of the Rules defined in the `//rules` package to make a convenient Stardoc target.

<a id="greeter_rule"></a>

## greeter_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "greeter_rule")

greeter_rule(<a href="#greeter_rule-name">name</a>, <a href="#greeter_rule-username">username</a>)
</pre>

Writes a greeting file to `username`

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="greeter_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="greeter_rule-username"></a>username |  The name of the user we're greeting   | String | optional |  `""`  |


<a id="hello_rule"></a>

## hello_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "hello_rule")

hello_rule(<a href="#hello_rule-name">name</a>)
</pre>

Writes a static greeting to a file

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="hello_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |


<a id="hello_temp_rule"></a>

## hello_temp_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "hello_temp_rule")

hello_temp_rule(<a href="#hello_temp_rule-name">name</a>)
</pre>

Writes a static greeting to a temp file

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="hello_temp_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |


<a id="json_greeter_rule"></a>

## json_greeter_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "json_greeter_rule")

json_greeter_rule(<a href="#json_greeter_rule-name">name</a>, <a href="#json_greeter_rule-username">username</a>)
</pre>

Generates a JSON file with a greeting to the designated `username`.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="json_greeter_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |
| <a id="json_greeter_rule-username"></a>username |  The name of the user we're greeting   | String | required |  |


<a id="noop_binary_rule"></a>

## noop_binary_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "noop_binary_rule")

noop_binary_rule(<a href="#noop_binary_rule-name">name</a>)
</pre>

A rule which does and returns nothing

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="noop_binary_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |


<a id="print_binary_rule"></a>

## print_binary_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "print_binary_rule")

print_binary_rule(<a href="#print_binary_rule-name">name</a>)
</pre>

A debugging rule used to view the evaluation context

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="print_binary_rule-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/concepts/labels#target-names">Name</a> | required |  |


<a id="product_rule"></a>

## product_rule

<pre>
load("@bite-sized-bazel//doc_hub:rules.bzl", "product_rule")

product_rule(<a href="#product_rule-kwargs">**kwargs</a>)
</pre>



**PARAMETERS**


| Name  | Description | Default Value |
| :------------- | :------------- | :------------- |
| <a id="product_rule-kwargs"></a>kwargs |  <p align="center"> - </p>   |  none |


