import libraries.stdlib.python.strings as str
import sys

basis = "Hello, "

print(basis + str.concatArray(sys.argv[1:]))
