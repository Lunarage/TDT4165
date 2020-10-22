# TDT4165 Assignment 4

## Task 3
The first three digits of the output is "100".

By threading the two tasks, one task does not have to wait for the other one to
finish. Unless one task relies on the result of another one.

## Task 4
When the function i lazy, it doesn't run before the result is needed.
In task 3, GenerateOdd does not generate a number before product asks for
another number. The odd numbers are thus generated (in parallel) with the
computation of the product.
