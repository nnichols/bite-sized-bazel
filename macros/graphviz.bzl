"""
A symbolic macro which processes a `.gv` file into a png.
"""

def _graphviz_impl(name, visibility, src, **kwargs):
    native.genrule(
        name = name,
        visibility = visibility,
        srcs = [src],
        outs = [name + ".png"],
        cmd = "dot -Tpng $< > $@ ",
        **kwargs
    )

    native.genrule(
        name = name + "_json",
        visibility = visibility,
        srcs = [src],
        outs = [name + ".json"],
        cmd = "dot -Tjson $< > $@ ",
        **kwargs
    )

    native.filegroup(
        name = name + "_filegroup",
        srcs = [
            name,
            name + "_json",
        ],
    )

# Macro declaration
graphviz = macro(
    doc = """Create a .png from the source .gv file

    The generated file name will share the same name as the input, but will have a different extension.
    """,
    implementation = _graphviz_impl,
    inherit_attrs = native.genrule,
    attrs = {
        "src": attr.label(
            doc = "Graph Files",
            allow_single_file = True,
            configurable = False,
        ),
        "srcs": None,
        "cmd": None,
        "outs": None,
    },
)
