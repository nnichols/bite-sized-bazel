"""
Communicates a numeric value to a dependent.
"""

NumberInfo = provider(
    doc = "Stores the numeric value for dependents",
    fields =
        {"number": "The number to communicate"},
)
