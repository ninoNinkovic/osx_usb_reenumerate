#!/bin/bash
g++ -x c reenumerate.c -o reenumerate -framework CoreFoundation -framework IOKit && ./reenumerate
