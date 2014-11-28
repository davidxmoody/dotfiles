#!/usr/bin/env python3

from collections import Counter
import fileinput

word_tallies = Counter()

for line in fileinput.input():
    words = line.split()
    words = [word.lower().strip('.,!?[]()*{}-<>:;"\'') for word in words]
    word_tallies.update(words)

for word, count in word_tallies.most_common(2000):
    print(count, word)
