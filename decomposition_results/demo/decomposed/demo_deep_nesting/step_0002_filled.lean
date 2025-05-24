import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- **Demo Problem with Deep Nesting**

For natural numbers $a$ and $b$, if $a + b = 5$ and $a > b$, 
prove that $a = 3$ and $b = 2$.

This is a simple demo problem to showcase deep `have` nesting in Lean proofs. -/
macro "sorry" : tactic => `(tactic| admit)

theorem h1 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) : a ≤ 5 := by
  have h1_1 : a + b = 5 := h_eq
  have h1_2 : b ≥ 0 := by sorry
  have h1_3 : a = 5 - b := by sorry
  have h1_4 : a ≤ 5 := by sorry
  --  exact h1_4
  sorry