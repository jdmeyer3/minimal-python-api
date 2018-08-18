from __future__ import absolute_import, division, print_function, unicode_literals

import os
import unittest

from .hello import Hello


class HelloTest(unittest.TestCase):
    def test_return(self):
        h = Hello.hello()
        self.assertEqual(h, 'hello')
