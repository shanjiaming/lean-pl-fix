theorem h₁ (N : ℤ) (hN : N ≥ 2) : ∀ n ≥ 2, (↑n ^ 3 - 1) / (↑n ^ 3 + 1) = (↑n - 1) / (↑n + 1) * ((↑n + 1) ^ 2 - (↑n + 1) + 1) / (↑n ^ 2 - ↑n + 1) :=
  by
  intro n hn
  have h₁ : (n : ℝ) ^ 3 - 1 = ((n : ℝ) - 1) * ((n : ℝ) ^ 2 + (n : ℝ) + 1 : ℝ) := by sorry
  have h₂ : (n : ℝ) ^ 3 + 1 = ((n : ℝ) + 1) * ((n : ℝ) ^ 2 - (n : ℝ) + 1 : ℝ) := by sorry
  rw [h₁, h₂]
  have h₃ : (n : ℝ) ≠ -1 := by sorry
  have h₄ : (n : ℝ) ^ 2 - (n : ℝ) + 1 ≠ 0 := by sorry
  field_simp [h₃, h₄, sub_eq_zero, add_eq_zero_iff_eq_neg] <;> ring_nf <;>
        field_simp [h₃, h₄, sub_eq_zero, add_eq_zero_iff_eq_neg] <;>
      ring_nf <;>
    nlinarith [sq_nonneg ((n : ℝ) - 1)]