theorem amc12b_2020_p13  : √(Real.log 6 / Real.log 2 + Real.log 6 / Real.log 3) = √(Real.log 3 / Real.log 2) + √(Real.log 2 / Real.log 3) :=
  by
  have h₁ :
    Real.log 6 / Real.log 2 + Real.log 6 / Real.log 3 = (Real.log 3 / Real.log 2) + (Real.log 2 / Real.log 3) + 2 := by sorry
  have h₂ :
    Real.sqrt (Real.log 6 / Real.log 2 + Real.log 6 / Real.log 3) =
      Real.sqrt ((Real.log 3 / Real.log 2) + (Real.log 2 / Real.log 3) + 2) := by sorry
  have h₃ :
    Real.sqrt ((Real.log 3 / Real.log 2) + (Real.log 2 / Real.log 3) + 2) =
      Real.sqrt (Real.log 3 / Real.log 2) + Real.sqrt (Real.log 2 / Real.log 3) := by sorry
  have h₄ :
    Real.sqrt (Real.log 6 / Real.log 2 + Real.log 6 / Real.log 3) =
      Real.sqrt (Real.log 3 / Real.log 2) + Real.sqrt (Real.log 2 / Real.log 3) := by sorry
  rw [h₄] <;> simp_all [Real.sqrt_eq_iff_sq_eq] <;> ring_nf at * <;>
        field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1),
          Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)] at * <;>
      ring_nf at * <;>
    nlinarith [Real.log_pos (by norm_num : (1 : ℝ) < 2), Real.log_pos (by norm_num : (1 : ℝ) < 3)]