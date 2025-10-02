import unittest
import libraries.stdlib.python.strings as str

class TestStringMethods(unittest.TestCase):

    def test_concatArrayEmpty(self):
        self.assertEqual(str.concatArray([]), '')

    def test_concatArrayOneEntry(self):
        self.assertEqual(str.concatArray(['hello']), 'hello')

    def test_concatArraySeveralEntries(self):
        self.assertEqual(str.concatArray(['hello' ' testing']), 'hello testing')

# Execute the tests defined in the above class
if __name__ == '__main__':
    unittest.main()
