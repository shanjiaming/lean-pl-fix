theorem h_main (p q r : ℝ) (inst✝² : Fact (p ≠ 0)) (inst✝¹ : Fact (q ≠ 0)) (inst✝ : Fact (r ≠ 0)) (h_denominator_ne_zero : 2 * p ^ 3 ≠ 0) : 4 * p ^ 4 * q ^ 7 * r ^ 8 = 2 * p ^ 3 * (2 * p * q ^ 7 * r ^ 8) :=
  by
  have h₁ : (4 : ℝ) * p ^ 4 * q ^ 7 * r ^ 8 = (2 * p ^ 3) * (2 * p * q ^ 7 * r ^ 8) := by sorry
  rw [h₁] <;> simp_all [mul_assoc] <;> ring <;> simp_all [mul_assoc] <;> ring