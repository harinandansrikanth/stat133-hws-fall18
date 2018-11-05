##################################################
## Project: Testing Functions and Strings
## Script purpose: This is the master script that runs the tests of the following functions: minkowski, is_hex, is_hex_alpha, reverse_chars, and count_vowels.
## Date: 11/4/18
## Author: Harinandan Srikanth
##################################################

library('testthat')
functions <- dir('../code/functions')
lapply(paste0('../code/functions/', functions), source)
sink(file = 'test-output.txt')
test_dir('../code/tests')
sink()