theorem h₂ (t : ℝ) (h₀ : ∀ (u : ℝ), u - 3 * u ^ 2 ≤ 1 / 12) (h₁ : 4 ^ t = 2 ^ (2 * t)) : 4 ^ t = (2 ^ t) ^ 2 :=
  by
  have h₃ : (4 : ℝ) ^ t = (2 : ℝ) ^ (2 * t) := h₁
  have h₄ : (2 : ℝ) ^ (2 * t) = ((2 : ℝ) ^ t) ^ 2 := by sorry
  rw [h₃, h₄] <;> ring_nf <;> norm_num <;> linarith