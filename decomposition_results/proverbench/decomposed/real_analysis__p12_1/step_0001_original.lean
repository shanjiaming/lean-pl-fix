theorem abs_sin_le_one (x✝ : ℕ → ℝ) (x : ℝ) : |Real.sin x| ≤ 1 :=
  by
  have h : -1 ≤ Real.sin x ∧ Real.sin x ≤ 1 := by sorry
  have h₁ : |Real.sin x| ≤ 1 := by sorry
  exact h₁