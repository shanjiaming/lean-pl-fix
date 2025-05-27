theorem h_expand_square (p q r : ℝ) (inst✝² : Fact (p ≠ 0)) (inst✝¹ : Fact (q ≠ 0)) (inst✝ : Fact (r ≠ 0)) : square_expression p q r = 4 * p ^ 4 * q ^ 4 * r ^ 6 := by
  calc
    square_expression p q r = (2 * p ^ 2 * q ^ 2 * r ^ 3) ^ 2 := rfl
    _ = 2 ^ 2 * (p ^ 2) ^ 2 * (q ^ 2) ^ 2 * (r ^ 3) ^ 2 := by ring
    _ = 4 * p ^ 4 * q ^ 4 * r ^ 6 := by ring <;> simp [pow_add, pow_mul, mul_assoc, mul_comm, mul_left_comm] <;> ring