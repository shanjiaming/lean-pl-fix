theorem greatest_negative_element : ∃ b : Int, b < 0 ∧ b ∈ B ∧ ∀ b' : Int, b' < 0 → b' ∈ B → b' ≤ b := by
  have h_main : ∃ (b : Int), b < 0 ∧ b ∈ B ∧ ∀ (b' : Int), b' < 0 → b' ∈ B → b' ≤ b := by
    use -4
    constructor
    · -- Prove -4 < 0
      norm_num
    constructor
    · -- Prove -4 ∈ B
      exact neg_four_in_B
    · -- Prove that for all b' < 0 in B, b' ≤ -4
      intro b' hb'_neg hb'_in_B
      have h_le : b' ≤ -4 := by
        apply neg_elements_bound b' hb'_in_B hb'_neg
      exact h_le
  exact h_main