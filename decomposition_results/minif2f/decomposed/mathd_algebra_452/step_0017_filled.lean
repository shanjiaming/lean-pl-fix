theorem h₁₁ (a : ℕ → ℝ) (h₀ : ∀ (n : ℕ), a (n + 2) - a (n + 1) = a (n + 1) - a n) (h₁ : a 1 = 2 / 3) (h₂ : a 9 = 4 / 5) (h₃ : a 2 - a 1 = a 1 - a 0) (h₄ : a 3 - a 2 = a 1 - a 0) (h₅ : a 4 - a 3 = a 1 - a 0) (h₆ : a 5 - a 4 = a 1 - a 0) (h₇ : a 6 - a 5 = a 1 - a 0) (h₈ : a 7 - a 6 = a 1 - a 0) (h₉ : a 8 - a 7 = a 1 - a 0) (h₁₀ : a 9 - a 8 = a 1 - a 0) : a 9 - a 1 = 8 * (a 1 - a 0) :=
  by
  have h₁₁₁ :
    a 9 - a 1 =
      (a 9 - a 8) + (a 8 - a 7) + (a 7 - a 6) + (a 6 - a 5) + (a 5 - a 4) + (a 4 - a 3) + (a 3 - a 2) + (a 2 - a 1) := by sorry
  --  rw [h₁₁₁]
  have h₁₁₂ : a 9 - a 8 = a 1 - a 0 := by sorry
  have h₁₁₃ : a 8 - a 7 = a 1 - a 0 := by sorry
  have h₁₁₄ : a 7 - a 6 = a 1 - a 0 := by sorry
  have h₁₁₅ : a 6 - a 5 = a 1 - a 0 := by sorry
  have h₁₁₆ : a 5 - a 4 = a 1 - a 0 := by sorry
  have h₁₁₇ : a 4 - a 3 = a 1 - a 0 := by sorry
  have h₁₁₈ : a 3 - a 2 = a 1 - a 0 := by sorry
  have h₁₁₉ : a 2 - a 1 = a 1 - a 0 := by sorry
  --  linarith
  linarith