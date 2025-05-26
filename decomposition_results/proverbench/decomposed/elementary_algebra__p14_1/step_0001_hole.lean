theorem combine_numerator  : sorry ^ 3 * sorry ^ 2 * sorry = 4 * sorry ^ 4 * sorry ^ 7 * sorry ^ 8 :=
  by
  have h_expand_square : square_expression p q r = 4 * p ^ 4 * q ^ 4 * r ^ 6 := by sorry
  have h_main : q ^ 3 * r ^ 2 * square_expression p q r = 4 * p ^ 4 * q ^ 7 * r ^ 8 := by sorry
  --  rw [h_main]
  hole