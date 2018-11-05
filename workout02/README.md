Workout 2 has two main objectives:
1. Creating a set of functions by applying documentation and structural 
concepts in R 
2. Implementing tests for these functions using the Rpackage "testthat"

The functions you will create in this workout are minkowski, is_hex, is_hex_alpha, reverse_chars, and count_vowels. These functions do the following things:
1. minkowski computes the Minkowski distance of order p between two points.
2. is_hex determines whether or not an input object is a valid color in hexadecimal notation. 
3. is_hex_alpha determines whether or not an input object is a valid color in hexadecimal notation **with an alpha transparency value**.
3. reverse_chars generates the reverse of an input string by characters.
4. count_vowels computes the number of each type of vowel (a,e,i,o,u) in an input character string.

The file structure after completing the workout should be such that the functions are in one file, the tests of these functions are in a seperate file within the same parent folder as the file storing the functions, and all of the tests are run collectively by a master script in an output parent folder seperate from the one holding the functions and tests.