"""
A provider for communicating the factors of a number.
"""

FactorInfo = provider(
    doc = "Stores the factors for dependents",
    fields =
        {"factors": "The list of numeric factors of the product"},
)
