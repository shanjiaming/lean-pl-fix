theorem h_main (h_expand_square : sorry = 4 * sorry ^ 4 * sorry ^ 4 * sorry ^ 6) : sorry ^ 3 * sorry ^ 2 * sorry = 4 * sorry ^ 4 * sorry ^ 7 * sorry ^ 8 :=
  by
  rw [h_expand_square]
  have h₁ : q ^ 3 * r ^ 2 * (4 * p ^ 4 * q ^ 4 * r ^ 6) = 4 * p ^ 4 * q ^ 7 * r ^ 8 := by sorry
  rw [h₁]