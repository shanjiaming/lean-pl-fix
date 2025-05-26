theorem h₀  : sorry ^ 3 * sorry ^ 2 * sorry / (2 * sorry ^ 3) = 4 * sorry ^ 4 * sorry ^ 7 * sorry ^ 8 / (2 * sorry ^ 3) :=
  by
  have h₀ : (q ^ 3 * r ^ 2 * square_expression p q r) = 4 * p ^ 4 * q ^ 7 * r ^ 8 := by sorry
  --  rw [h₀] <;> simp [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> norm_num <;>
    linarith [Fact.out (p := p ≠ 0), Fact.out (p := q ≠ 0), Fact.out (p := r ≠ 0)]
  hole