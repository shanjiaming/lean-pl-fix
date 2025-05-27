theorem greatest_negative_element : ∃ b : Int, b < 0 ∧ b ∈ B ∧ ∀ b' : Int, b' < 0 → b' ∈ B → b' ≤ b:=
  by
  have h_main : ∃ (b : Int), b < 0 ∧ b ∈ B ∧ ∀ (b' : Int), b' < 0 → b' ∈ B → b' ≤ b:=
    by
    --  use -4
    --  constructor
    --  · norm_num
    --  constructor
    --  · exact neg_four_in_B
    --  · intro b' hb'_neg hb'_in_B
      have h_le : b' ≤ -4:= by -- apply neg_elements_bound b' hb'_in_B hb'_neg
        hole
    --    exact h_le
    hole
  --  exact h_main
  simpa