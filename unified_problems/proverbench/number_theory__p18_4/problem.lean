theorem neg_four_in_B : -4 ∈ B := by
  have h_main : ∃ (k : ℤ), -4 = -44 + 5 * k := by
    refine' ⟨8, _⟩
    -- We choose k = 8 to satisfy the equation -4 = -44 + 5 * k
    norm_num
    <;> ring_nf
    <;> norm_num
    <;> linarith
  
  have h_final : -4 ∈ B := by
    rw [characterize_B]
    -- Use the previously found value of k to prove -4 is in B
    exact h_main
  
  exact h_final