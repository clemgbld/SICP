# Notes chapter 1

## Subsitution model (applicative order)

This is the concept of applying each procedure into the argument of other procedure until we get the final value.

## Normal order

This is the concept of applying the operands only when their values is needed ( when an expression contains only primitive operators).

## Iterative process

Compute at each iteration, well known states with fixed rules

- Advantages = very straightforward

- Drawbacks = usally more code to write

## Linear recursive process

It each iteration create a delayed operation that will be executed at the end(the interpreter needs to keep track of those delayed operations).

- Advantages = way less code to write

- Drawbacks = complicated at first to know how it works when not familiar with the concept and the space complexity can grow very rapidly (memory consumption) in programming languages that are not built to support tail recursion.

personal thought : look like the normal order (lazy evaluation)

recursive process != recursive procedure
