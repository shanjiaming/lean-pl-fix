theorem neg_four_in_B  : -4 ∈ B :=
  by
  have h_main : ∃ (k : ℤ), -4 = -44 + 5 * k := by sorry
  have h_final : -4 ∈ B := by sorry
  --  exact h_final
  simpa