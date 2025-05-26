theorem h_main (k : ℤ) : ∃ m n, m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 :=
  by
  refine' ⟨-110 + 12 * k, 66 - 7 * k, by ring, by ring, _⟩
  ring_nf <;> norm_num <;> linarith