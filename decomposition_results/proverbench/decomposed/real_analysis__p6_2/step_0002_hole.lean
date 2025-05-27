theorem h_false (a b : ℕ+ → ℝ≥0) (h : ∀ (n : ℕ+), a n ≤ b n) (hb : ¬Summable b) : False :=
  by
  have h₂ : general_term (2 : ℕ+) ≤ comparison_series (2 : ℕ+) := upper_bound (2 : ℕ+)
  have h₃ : ¬(general_term (2 : ℕ+) ≤ comparison_series (2 : ℕ+)) := by sorry
  --  exact h₃ h₂
  hole