import Mathlib
import LeanCodePrompts.Translate
import LeanAide.Syntax

set_option lean_aide.translate.greedy true

#theorem silly : "If a vector space has dimension `2` then it is finite dimensional"

#theorem "There are infinitely many odd numbers"

#ask "Prove that there are infinitely many even numbers"

example : {n : Nat | Odd n}.Infinite := by sorry
