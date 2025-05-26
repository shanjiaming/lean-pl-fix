theorem simplify_fraction  : 4 * sorry ^ 4 * sorry ^ 7 * sorry ^ 8 / (2 * sorry ^ 3) = 2 * sorry * sorry ^ 7 * sorry ^ 8 :=
  by
  have h_denominator_ne_zero : (2 : ℝ) * p ^ 3 ≠ 0 := by sorry
  have h_main : (4 : ℝ) * p ^ 4 * q ^ 7 * r ^ 8 = (2 * p ^ 3) * (2 * p * q ^ 7 * r ^ 8) := by sorry
  have h_final : (4 * p ^ 4 * q ^ 7 * r ^ 8) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8 := by sorry
  rw [h_final] <;> simp_all [mul_assoc] <;> ring <;> simp_all [mul_assoc] <;> ring