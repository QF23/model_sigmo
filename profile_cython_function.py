#!/usr/bin/env python

# program: profile_cython_function.py
# author: tc
# created: 2016-05-12 -- 19 CEST
# notes: heavily inspired by the example in
#        https://gist.github.com/tillahoffmann/296501acea231cbdf5e7


import line_profiler
from no_memory_random_walk_cython import random_walk

#ARGUMENTS

M = 10000
time = 2000000
size = 2.0 
M_W = int(M*size)
W = 5 
beta = 1.0
gamma = 21.7
alloc = 0
both_mechs = 0


# arguments to be passed to the function which I want to profile
arguments = [gamma,beta,time,W,M,M_W,alloc,both_mechs]

profile = line_profiler.LineProfiler(random_walk)
profile.runcall(random_walk, *arguments)
profile.print_stats()
