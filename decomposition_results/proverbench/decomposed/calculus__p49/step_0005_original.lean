theorem h₁₂ (x : ℝ) : x ^ 2 / (1 + x ^ 2) = 1 - 1 / (1 + x ^ 2) :=
  by
  by_cases h : (1 + x ^ 2 : ℝ) = 0
  ·
    have h₂ : x ^ 2 = -1 := by sorry
    have h₃ : (x : ℝ) ^ 2 ≥ 0 := by sorry
    nlinarith
  · field_simp [h] <;> ring <;> field_simp [h] <;> ring