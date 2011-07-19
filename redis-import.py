#!/usr/bin/env python

import fileinput, re, redis

r = redis.Redis(host='localhost', port=6379, db=0)
pipe = r.pipeline()

pattern = re.compile("\"id\": (\d+),")
count = 0

for line in fileinput.input():
    match = pattern.search(line)
    if match:
        pipe.set(match.group(1), line)

        count += 1
        if count % 100 == 0:
            pipe.execute()
            count = 0

pipe.execute()
