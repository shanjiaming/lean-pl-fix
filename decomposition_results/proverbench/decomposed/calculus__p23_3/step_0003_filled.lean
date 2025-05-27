theorem h₁ (n : ℕ) : a_n = fun n => (1 + (2 / 3) ^ n) / (3 * (1 - (2 / 3) ^ (n + 1))) :=
  by
  --  funext n
  --  rw [sequence_rewrite] <;> simp [a_n] <;> field_simp <;> ring <;> norm_num <;>
          simp_all [pow_add, pow_one, mul_assoc] <;>
        field_simp <;>
      ring <;>
    norm_num
  hole