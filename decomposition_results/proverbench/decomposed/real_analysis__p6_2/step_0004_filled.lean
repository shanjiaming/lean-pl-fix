theorem h_main (a b : ℕ+ → ℝ≥0) (h : ∀ (n : ℕ+), a n ≤ b n) (hb : ¬Summable b) (h_false : False) : ¬Summable a := by
  --  exfalso
  --  exact h_false
  norm_cast