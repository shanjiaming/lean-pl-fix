import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- **Demo Problem with Deep Nesting**

For natural numbers $a$ and $b$, if $a + b = 5$ and $a > b$, 
prove that $a = 3$ and $b = 2$.

This is a simple demo problem to showcase deep `have` nesting in Lean proofs. -/
macro "sorry" : tactic => `(tactic| admit)

theorem demo_deep_nesting (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) : a = 3 ∧ b = 2 :=
  by
  have h1 : a ≤ 5 := by sorry
  have h2 : b ≤ 5 := by sorry
  have h3 : a > b := h_gt
  have h4 : a + b = 5 := h_eq
  have h5 : a = 3 ∧ b = 2 := by sorry
  --  exact h5
  sorry