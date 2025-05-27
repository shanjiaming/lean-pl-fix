theorem h_main  : ∃ b < 0, b ∈ B ∧ ∀ b' < 0, b' ∈ B → b' ≤ b :=
  by
  use -4
  constructor
  · norm_num
  constructor
  · exact neg_four_in_B
  · intro b' hb'_neg hb'_in_B
    have h_le : b' ≤ -4 := by sorry
    exact h_le