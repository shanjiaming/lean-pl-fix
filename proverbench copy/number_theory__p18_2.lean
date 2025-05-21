lemma general_solution (k : Int) : ∃ m n : Int, m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by
  have h_main : ∃ (m n : Int), m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by
    refine' ⟨-110 + 12 * k, 66 - 7 * k, by ring, by ring, _⟩
    -- Verify that 7 * m + 12 * n = 22 with the chosen m and n
    ring_nf
    <;> norm_num
    <;> linarith
  
  exact h_main