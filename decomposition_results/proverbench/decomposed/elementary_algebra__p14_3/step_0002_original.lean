theorem h₀ (p q r : ℝ) (inst✝² : Fact (p ≠ 0)) (inst✝¹ : Fact (q ≠ 0)) (inst✝ : Fact (r ≠ 0)) : q ^ 3 * r ^ 2 * square_expression p q r / (2 * p ^ 3) = 4 * p ^ 4 * q ^ 7 * r ^ 8 / (2 * p ^ 3) :=
  by
  have h₀ : (q ^ 3 * r ^ 2 * square_expression p q r) = 4 * p ^ 4 * q ^ 7 * r ^ 8 := by sorry
  rw [h₀] <;> simp [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> norm_num <;>
    linarith [Fact.out (p := p ≠ 0), Fact.out (p := q ≠ 0), Fact.out (p := r ≠ 0)]