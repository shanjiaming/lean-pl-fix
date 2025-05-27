theorem cubic_interpolation_for_powers_of_two  : ∀ i ∈ S, 2 ^ i = Q ↑i :=
  by
  --  intro i hi
  have h : i = 0 ∨ i = 1 ∨ i = 2 ∨ i = 3 := by sorry
  have h_main : (2 : ℝ) ^ i = Q i := by sorry
  --  exact h_main
  hole