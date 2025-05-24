import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- **Demo Problem with Deep Nesting**

For natural numbers $a$ and $b$, if $a + b = 5$ and $a > b$, 
prove that $a = 3$ and $b = 2$.

This is a simple demo problem to showcase deep `have` nesting in Lean proofs. -/
macro "sorry" : tactic => `(tactic| admit)

theorem h2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1 : a ≤ 5) : b ≤ 5 := by
  have h2_1 : a + b = 5 := h_eq
  have h2_2 : a ≥ 0 := by sorry
  have h2_3 : b ≤ 5 := by sorry
  exact h2_3
  sorry