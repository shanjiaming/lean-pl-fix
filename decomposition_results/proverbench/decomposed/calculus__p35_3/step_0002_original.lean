theorem h_main (x : ℝ) : ∃ δ, ∃ (_ : 0 < δ), ∀ (x : ℝ), |x - 2| < δ → f x ≤ f 2 :=
  by
  use 1
  use by norm_num
  intro x hx
  have h₁ : f x = x ^ 3 - 9 * x ^ 2 + 24 * x := rfl
  have h₂ : f 2 = 20 := by sorry
  rw [h₁, h₂]
  have h₃ : |x - 2| < 1 := hx
  have h₄ : -1 < x - 2 := by sorry
  have h₅ : x - 2 < 1 := by sorry
  have h₆ : 1 < x := by sorry
  have h₇ : x < 3 := by sorry
  have h₈ : x < 5 := by sorry
  have h₉ : (x - 2) ^ 2 * (x - 5) ≤ 0 := by sorry
  have h₁₀ : x ^ 3 - 9 * x ^ 2 + 24 * x - 20 ≤ 0 := by sorry
  linarith