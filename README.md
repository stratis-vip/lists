# Lists utilities

A collection of utilities for lists. These utilities were needed for my projects.

# Overview

Utilities about lists manipulation. Making my life easier.

# Usage

## Installation

You need to clone this repo to a position that common lisp recognize (usually to ~/common-lisp/).
After that
## Functions

### memberp

```lisp
(defun memberp (item lst &key (test #'eql))
  "Check if ITEM is in LST against TEST function.

   ITEM any value
   LST a list of any type
   TEST the equality function

   Returns T if item is in the LST. Else NIL or TYPE-ERROR if no list or no-function given."
...)
```

### cartesian-power

```lisp 
(defun cartesian-power (lst n)
 "Return the N-th Cartesian power of LST.

The result is a list containing all possible ordered sequences of
length N whose elements are chosen from LST. Elements may be repeated.

If N is zero, return a list containing the empty list.

Examples:
  (cartesian-power '(1 2) 3)
  => ((1 1 1) (1 1 2) (1 2 1) (1 2 2)
      (2 1 1) (2 1 2) (2 2 1) (2 2 2))

Signals an error if LST is not a list or N is not a non-negative integer."
   ...)
 ```

### cartesian-product

```lisp
 (defun cartesian-product (&rest lsts)
  "Return the Cartesian product of LSTS.

Each argument in LSTS must be a list. The result is a list containing
all possible combinations, represented as lists, with one element taken
from each input list.

If no lists are supplied, return a list containing the empty list.
If any input list is empty, the Cartesian product is NIL.

Examples:
  (cartesian-product '(1 2) '(a b))
  => ((1 A) (1 B) (2 A) (2 B))

  (cartesian-product '(1 2) '(a b) '(x y))
  => ((1 A X) (1 A Y) (1 B X) (1 B Y)
      (2 A X) (2 A Y) (2 B X) (2 B Y))"
  ...)
 ```

### permutations-without-replacement

```lisp
(defun permutations-without-replacement (lst n &key (test #'eql))
  "Return all permutations of N elements chosen from LST without replacement.

Each result is an ordered sequence, represented as a list of length N.
An element of LST can occur at most once in any individual sequence.
The TEST function determines when two elements are considered equal
and is used when removing an element after it has been selected.

If N is zero, return a list containing the empty list.
If N is greater than the length of LST, return NIL.

Examples:
  (permutations-without-replacement '(1 2 3) 2)
  => ((1 2) (1 3) (2 1) (2 3) (3 1) (3 2))

  (permutations-without-replacement '(1 2 3) 0)
  => (NIL)

  (permutations-without-replacement '(1 2 3) 4)
  => NIL."
  ...)
```
