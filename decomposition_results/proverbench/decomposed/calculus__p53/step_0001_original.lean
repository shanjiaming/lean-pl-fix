theorem integral_of_rational_function  : ∫ (x : ℝ) in sorry..sorry, 4 / (x ^ 2 - 7 * x + 12) = (↑4 : ℝ) * sorry - (↑4 : ℝ) * sorry :=
  by
  have h₁ : a = 100 := by sorry
  have h₂ : b = 200 := by sorry
  have h₃ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x ^ 2 - 7 * x + 12) = 4 * log (196 / 96) - 4 * log (197 / 97) := by sorry
  have h₄ : ∫ x in a..b, (4 : ℝ) / (x ^ 2 - 7 * x + 12) = 4 * log (196 / 96) - 4 * log (197 / 97) := by sorry
  apply h₄