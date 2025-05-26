theorem h₄ (h₂ : 3 ^ 200 < 10 ^ 100 + 3) : 10 ^ 20000 / (10 ^ 100 + 3) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) + 3 ^ 200 / (10 ^ 100 + 3) :=
  --  --  by field_simp [add_comm] <;> ring_nf <;> norm_num <;> linarith
  hole