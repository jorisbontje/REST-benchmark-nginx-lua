#!/usr/bin/env python

import fileinput, re
from pykt import KyotoTycoon

db = KyotoTycoon()
db = db.open()

pattern = re.compile("\"id\": (\d+),")
count = 0
d = {}

for line in fileinput.input():
    match = pattern.search(line)
    if match:
        d[match.group(1)] = line

        count += 1
        if count % 100 == 0:
            db.set_bulk(d)
            d = {}
            count = 0

db.set_bulk(d)
