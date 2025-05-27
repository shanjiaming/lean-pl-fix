theorem neg_four_in_B : -4 ∈ B:=
  by
  have h_main : ∃ (k : ℤ), -4 = -44 + 5 * k:= by
    --  refine' ⟨8, _⟩
    --  norm_num <;> ring_nf <;> norm_num <;> linarith
    hole
  have h_final : -4 ∈ B:= by
    --  rw [characterize_B]
    --  exact h_main
    hole
  --  exact h_final
  simpa