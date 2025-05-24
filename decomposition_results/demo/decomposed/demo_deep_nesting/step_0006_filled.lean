import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- **Demo Problem with Deep Nesting**

For natural numbers $a$ and $b$, if $a + b = 5$ and $a > b$, 
prove that $a = 3$ and $b = 2$.

This is a simple demo problem to showcase deep `have` nesting in Lean proofs. -/
macro "sorry" : tactic => `(tactic| admit)

theorem h1_4 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) (h1_3 : a = 5 - b) : a ≤ 5 := by
  --  rw [h1_3]
  have h1_4_1 : b ≥ 0 := h1_2
  have h1_4_2 : 5 - b ≤ 5 := by sorry
  --  exact h1_4_2
  sorry