import Mathlib

open Nat

-- 3
/--
For each positive integer $n$, let $k(n)$ be the number of ones in the binary representation of $2023 * n$. What is the minimum value of $k(n)$?
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2023_b2
: sInf {(digits 2 (2023*n)).sum | n > 0} = ((3) : ℕ ) := by
  have h₁ : 3 ∈ {(digits 2 (2023*n)).sum | n > 0} := by
    
    
    hole_1

  have h₂ : sInf {(digits 2 (2023*n)).sum | n > 0} = 3 := by
    
    hole_2

  
  hole_3