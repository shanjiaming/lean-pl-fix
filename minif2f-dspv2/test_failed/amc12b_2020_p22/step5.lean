theorem h₂ (t : ℝ) (h₀ : ∀ (u : ℝ), u - 3 * u ^ 2 ≤ 1 / 12) : 4 ^ t = 2 ^ (2 * t) := by
  calc
    (4 : ℝ) ^ t = (2 : ℝ) ^ (2 * t) :=
      by
      have h₃ : (4 : ℝ) ^ t = (2 : ℝ) ^ (2 * t) := by
        calc
          (4 : ℝ) ^ t = ((2 : ℝ) ^ 2) ^ t := by norm_num
          _ = (2 : ℝ) ^ (2 * t) := by
            rw [← Real.rpow_nat_cast]
            rw [← Real.rpow_mul] <;> ring_nf <;> norm_num <;> linarith
          _ = (2 : ℝ) ^ (2 * t) := by rfl
      rw [h₃]
    _ = (2 : ℝ) ^ (2 * t) := by rfl