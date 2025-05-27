theorem greatest_negative_element  : ∃ b < 0, b ∈ B ∧ ∀ b' < 0, b' ∈ B → b' ≤ b :=
  by
  have h_main : ∃ (b : Int), b < 0 ∧ b ∈ B ∧ ∀ (b' : Int), b' < 0 → b' ∈ B → b' ≤ b := by sorry
  --  exact h_main
  simpa