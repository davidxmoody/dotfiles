#!/usr/bin/env python3

from collections import Counter
import fileinput

word_tallies = Counter()

for line in fileinput.input():
    word_tallies.update(line.split())

for word, count in word_tallies.most_common(2000):
    print(count, word)
