theorem h₂ (p q r : ℝ) (inst✝² : Fact (p ≠ 0)) (inst✝¹ : Fact (q ≠ 0)) (inst✝ : Fact (r ≠ 0)) (h₀ : q ^ 3 * r ^ 2 * square_expression p q r / (2 * p ^ 3) = 4 * p ^ 4 * q ^ 7 * r ^ 8 / (2 * p ^ 3)) (h₁ : 4 * p ^ 4 * q ^ 7 * r ^ 8 / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8) : q ^ 3 * r ^ 2 * square_expression p q r / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8 :=
  by
  rw [h₀]
  rw [h₁] <;>
    try norm_num <;> try ring_nf <;> try linarith [Fact.out (p := p ≠ 0), Fact.out (p := q ≠ 0), Fact.out (p := r ≠ 0)]