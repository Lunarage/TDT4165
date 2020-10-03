# TDT4165 Assignment 3

## Task 1

### (a)

```
1  proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
2     local D in
3        D = B * B - 4.0 * A * C
4        if D < 0.0 then
5           RealSol = false
6        else
7           RealSol = true
8           X1 = (~B + {Sqrt D}) / (2.0 * A)
9           X2 = (~B - {Sqrt D}) / (2.0 * A)
10       end
11    end
12 end
```

### (b)
A procedure is reusable throughout the code;
we do not have to implement a set of instructions
every time we have to solve the same problem.
In addition, when someone wants to use a procedure,
they don't need to know how it is implemented.
E.g. I occasionally use the built in _sqrt(n)_ function
that comes shipped with many programming languages.
I don't know how it is implemented, but i know what it does.

### (c)
In oz, a function is a specific case of procedures.
A procedure is a routine one can call without arguments
and does not return anything.
A function is a procedure with one extra argument
which is unbound at calling time.
The value assigned to this variable is the return value.

## Task 2

```
1  fun {Sum List}
2     % Tail recursion
3     fun {Sum List A}
4        case List
5           of nil then A
6           [] H|T then {Sum T A+H}
7        end
8     end
9     in {Sum List 0}
10 end
```

## Task 3

### (a)

```
1 fun {RightFold List Op U}
2    case List
3       of nil then U
4       [] H|T then
5          {Op H {RightFold T Op U}}
6    end
7 end
```

### (b)

1. Declaration of the function
2. case switch
3. if the element is nil, return the neutral operator _U_
4. pattern matching
5. Call the operator function with Head of list as the first argument,
and call the function RightFold recursively as the second argument.
6. close function declaration
7. close case

### (c)
```
1  fun {Length List}
2     {RightFold List fun {$ _ X} 1 + X end 0}
3  end
5  fun {Sum List}
6     {RightFold List fun {$ X Y} X + Y end 0}
7  end
```

### (d)
Since the operations sum and product are commutative,
there is no difference between using right fold and left fold.
If the operation function passed is non-commutative, there is a difference.
Subtraction is an example of an operation that is not commutative.

### (e)
When a neutral element is passed to an operation,
it results in no change. 
Because adding 0 to a number has the same result of not doing the addition,
the neutral element is 0 for addition.
For products, the same is true for multiplying by 1,
and so a good value for _U_ is 1.

## Task 4

```
1  fun {Quadratic A B C}
2     fun {$ X}
3        A*X*X + B*X + C
4     end
5  end
```

## Task 5

### (a)
```
1  fun {LazyNumberGenerator StartValue}
2     StartValue | fun {$} {LazyNumberGenerator StartValue+1} end
3  end
```

### (b)
When _LazyNumberGenerator_ is called,
it returns a list containing _StartValue_ as the first element,
and an anonymous function as the second element.
The anonymous function is defined to be a call to _LazyNumberGenerator_
with _StartValue_ + 1.

## Task 6
<!---
https://www.youtube.com/watch?v=_JtPhF8MshA&t=357s
-->

### (a)

Yes.
A function is tail recursive if the last call a function does is the recursion.
In my implementation of Sum, the arithmetic is preformed in the body of the
function before it calls itself recursively.
The accumulated value is passed down and returned when the recursion ends.

### (b)
Tail recursion, as opposed to other recursions,
does not grow the semantic stack (statements in execution).
"Normal" recursion expands the stack until it reaches the base case
and then works backwards to evaluate the resulting expression.
Tail recursion evaluates expressions on the fly
and trades space on the semantic stack.

### (c)
Since tail recursion does not grow the semantic stack to ridiculous sizes
(for long recursion chains),
all programming languages that allow recursion should benefit from recursion.
