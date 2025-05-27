theorem count_not_div_three  : ¬3 ∣ countPoints 2012 :=
  by
  have h_main : (countPoints 2012) % 3 = 2 := by sorry
  have h_final : ¬(3 ∣ countPoints 2012) := by sorry
  exact h_final