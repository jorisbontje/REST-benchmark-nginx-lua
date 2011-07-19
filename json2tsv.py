#!/usr/bin/env python

import fileinput, re, sys

pattern = re.compile("\"id\": (\d+),")

for line in fileinput.input():
    match = pattern.search(line)
    if match:
        sys.stdout.write(match.group(1) + "\t" + line)
