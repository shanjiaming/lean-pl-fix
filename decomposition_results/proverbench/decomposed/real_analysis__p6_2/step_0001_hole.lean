theorem comparison_test (a b : ℕ+ → ℝ≥0) (h : ∀ (n : ℕ+), a n ≤ b n) (hb : ¬Summable b) : ¬Summable a :=
  by
  have h_false : False := by sorry
  have h_main : ¬Summable a := by sorry
  --  exact h_main
  hole