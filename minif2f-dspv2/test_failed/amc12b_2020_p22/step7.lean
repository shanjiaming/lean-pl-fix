theorem h₄ (t : ℝ) (h₀ : ∀ (u : ℝ), u - 3 * u ^ 2 ≤ 1 / 12) (h₁ h₃ : 4 ^ t = 2 ^ (2 * t)) : 2 ^ (2 * t) = (2 ^ t) ^ 2 := by
  calc
    (2 : ℝ) ^ (2 * t) = (2 : ℝ) ^ (t + t) := by ring
    _ = (2 : ℝ) ^ t * (2 : ℝ) ^ t := by rw [Real.rpow_add] <;> ring_nf <;> norm_num <;> linarith
    _ = ((2 : ℝ) ^ t) ^ 2 := by ring