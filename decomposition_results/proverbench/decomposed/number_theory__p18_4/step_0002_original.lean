theorem h_main  : ∃ k, -4 = -44 + 5 * k := by
  refine' ⟨8, _⟩
  norm_num <;> ring_nf <;> norm_num <;> linarith