import Mathlib

open Set Real

-- 7 / 4
/--
Find
\[
\sum_{i=1}^{\infty} \sum_{j=1}^{\infty} \frac{1}{i^2j + 2ij + ij^2}.
\]
-/
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)

theorem putnam_1978_b2
: (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2) = ((7 / 4) : ℚ )) := by
  have h_main : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ) := by
    
    have h₁ : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ) := by
      
      have h₂ : (∑' i : ℕ+, ∑' j : ℕ+, (1 : ℚ) / (i ^ 2 * j + 2 * i * j + i * j ^ 2)) = (7 / 4 : ℚ) := by
        
        hole_2
  hole_5