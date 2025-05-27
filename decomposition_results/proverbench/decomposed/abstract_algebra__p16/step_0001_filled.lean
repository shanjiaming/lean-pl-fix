theorem unique_constant_solutions (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) : P = C (2 + √5) ∨ P = C (2 - √5) :=
  by
  have h_constant : P.degree ≤ 0 := by sorry
  have h_main : P = C (2 + Real.sqrt 5) ∨ P = C (2 - Real.sqrt 5) := by sorry
  --  exact h_main
  norm_cast