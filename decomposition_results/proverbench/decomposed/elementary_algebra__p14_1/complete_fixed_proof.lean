theorem combine_numerator : q ^ 3 * r ^ 2 * square_expression p q r = 4 * p ^ 4 * q ^ 7 * r ^ 8:=
  by
  have h_expand_square : square_expression p q r = 4 * p ^ 4 * q ^ 4 * r ^ 6:= by
    calc
      square_expression p q r = (2 * p ^ 2 * q ^ 2 * r ^ 3) ^ 2 := rfl
      _ = 2 ^ 2 * (p ^ 2) ^ 2 * (q ^ 2) ^ 2 * (r ^ 3) ^ 2 := by ring
      _ = 4 * p ^ 4 * q ^ 4 * r ^ 6 := by ring <;> simp [pow_add, pow_mul, mul_assoc, mul_comm, mul_left_comm] <;> ring
    hole
  have h_main : q ^ 3 * r ^ 2 * square_expression p q r = 4 * p ^ 4 * q ^ 7 * r ^ 8:=
    by
    rw [h_expand_square]
    have h₁ : q ^ 3 * r ^ 2 * (4 * p ^ 4 * q ^ 4 * r ^ 6) = 4 * p ^ 4 * q ^ 7 * r ^ 8:= by ring
      hole
    rw [h₁]
    hole
  rw [h_main]
  hole