theorem sum_polynomials : f + g = C 2 * X^2 - C 3 := by
  have h₁ : f + g = C 2 * X^2 - C 3 := by
    calc
      f + g = (C 4 * X - C 5 : Polynomial (ZMod 8)) + (C 2 * X ^ 2 - C 4 * X + C 2 : Polynomial (ZMod 8)) := by rfl
      _ = C 2 * X ^ 2 - C 3 := by
        -- Simplify the expression by combining like terms and using the properties of ZMod 8
        norm_num [f, g, add_assoc, add_comm, add_left_comm, mul_comm, mul_assoc, mul_left_comm,
          sub_eq_add_neg]
        <;>
        ring_nf
        <;>
        norm_num
        <;>
        rfl
  exact h₁