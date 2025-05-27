theorem amc12b_2020_p22 (t : ℝ) : (2 ^ t - 3 * t) * t / 4 ^ t ≤ 1 / 12 :=
  by
  have h₀ : ∀ (u : ℝ), u - 3 * u ^ 2 ≤ 1 / 12 := by sorry
  have h₁ : (4 : ℝ) ^ t = (2 : ℝ) ^ (2 * t) := by sorry
  have h₂ : (4 : ℝ) ^ t = ((2 : ℝ) ^ t) ^ 2 := by sorry
  have h₃ : (2 ^ t - 3 * t) * t / 4 ^ t = (t / (2 : ℝ) ^ t - 3 * (t / (2 : ℝ) ^ t) ^ 2) := by sorry
  have h₄ : (t / (2 : ℝ) ^ t - 3 * (t / (2 : ℝ) ^ t) ^ 2) ≤ 1 / 12 := by sorry
  have h₅ : (2 ^ t - 3 * t) * t / 4 ^ t ≤ 1 / 12 := by sorry
  exact h₅