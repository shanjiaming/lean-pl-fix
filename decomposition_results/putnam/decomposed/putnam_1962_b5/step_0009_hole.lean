theorem h₆₁ (n : ℤ) (ng1 : n > 1) (h₂ h₃ : n ≥ 2) (h₄ : (↑n : ℝ) ≥ 2) (h₅ : (3 * (↑n : ℝ) + 1) / (2 * (↑n : ℝ) + 2) < ∑ i, ((↑(↑i : ℤ) : ℝ) / (↑n : ℝ)) ^ (↑n : ℝ)) : n ≤ 5 ∨ n ≥ 6 := by
  --  by_cases h : n ≤ 5
  --  · exact Or.inl h
  --  · exact Or.inr (by linarith)
  hole