import libraries.stdlib.python.strings as str
import json
import sys

basis = "Hello, "
basis += str.concatArray(sys.argv[1:])

print(json.dumps({"greeting": basis}))
