theorem simplify_expression : (q ^ 3 * r ^ 2 * square_expression p q r) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8:=
  by
  have h₀ : (q ^ 3 * r ^ 2 * square_expression p q r) / (2 * p ^ 3) = (4 * p ^ 4 * q ^ 7 * r ^ 8) / (2 * p ^ 3):=
    by
    have h₀ : (q ^ 3 * r ^ 2 * square_expression p q r) = 4 * p ^ 4 * q ^ 7 * r ^ 8:= by -- apply combine_numerator
      hole
    --  rw [h₀] <;> simp [div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;> norm_num <;>
      linarith [Fact.out (p := p ≠ 0), Fact.out (p := q ≠ 0), Fact.out (p := r ≠ 0)]
    hole
  have h₁ : (4 * p ^ 4 * q ^ 7 * r ^ 8) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8:= by -- sorry
    hole
  have h₂ : (q ^ 3 * r ^ 2 * square_expression p q r) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8:=
    by
    --  rw [h₀]
    rw [h₁] <;>
      try norm_num <;> try ring_nf <;> try linarith [Fact.out (p := p ≠ 0), Fact.out (p := q ≠ 0), Fact.out (p := r ≠ 0)]
    hole
  --  exact h₂
  hole