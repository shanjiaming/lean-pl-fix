theorem putnam_1978_a1 (S T : Set ℤ) (hS : S = {k | ∃ j, 0 ≤ j ∧ j ≤ 33 ∧ k = 3 * j + 1}) (hT : T ⊆ S ∧ T.ncard = 20) : ∃ m ∈ T, ∃ n ∈ T, m ≠ n ∧ m + n = 104 :=
  by
  have h_main : ∃ m ∈ T, ∃ n ∈ T, m ≠ n ∧ m + n = 104 := by sorry
  --  exact h_main
  simpa