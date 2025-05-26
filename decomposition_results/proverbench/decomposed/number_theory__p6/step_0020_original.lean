theorem h₅ (d : ℤ) (t : ℚ) (h_main : (↑d : ℚ) * t ^ 2 - 1 = 0 ∨ (↑d : ℚ) * t ^ 2 - 1 ≠ 0) (h_case_zero :  (↑d : ℚ) * t ^ 2 - 1 = 0 →    ∃ x y,      x = ((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1) ∧        y = 2 * t / ((↑d : ℚ) * t ^ 2 - 1) ∧ x ^ 2 - (↑d : ℚ) * y ^ 2 = 1) (h₁ h₂ h₃ h₄ : (↑d : ℚ) * t ^ 2 - 1 ≠ 0) : (((↑d : ℚ) * t ^ 2 + 1) / ((↑d : ℚ) * t ^ 2 - 1)) ^ 2 - (↑d : ℚ) * (2 * t / ((↑d : ℚ) * t ^ 2 - 1)) ^ 2 = 1 :=
  by
  have h₅₁ : (d * t ^ 2 - 1 : ℚ) ≠ 0 := by sorry
  field_simp [h₅₁, sub_eq_zero, add_eq_zero_iff_eq_neg] <;> ring_nf <;>
            field_simp [h₅₁, sub_eq_zero, add_eq_zero_iff_eq_neg] <;>
          norm_num <;>
        ring_nf <;>
      norm_num <;>
    linarith