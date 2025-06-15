theorem combine_numerator : q^3 * r^2 * square_expression p q r = 4 * p^4 * q^7 * r^8 := by
  have h_expand_square : square_expression p q r = 4 * p^4 * q^4 * r^6 := by
    admit
  
  have h_main : q^3 * r^2 * square_expression p q r = 4 * p^4 * q^7 * r^8 := by
    rw [h_expand_square]
    have h₁ : q ^ 3 * r ^ 2 * (4 * p ^ 4 * q ^ 4 * r ^ 6) = 4 * p ^ 4 * q ^ 7 * r ^ 8 := by
      admit
    admit
    
  admit