theorem h_d_eq_13_div_15 (a b c d : ℚ) (h₀ : 3 * a = b + c + d) (h₁ : 4 * b = a + c + d) (h₂ : 2 * c = a + b + d) (h₃ : 8 * a + 10 * b + 6 * c = 24) (h₅b_eq_4a : 5 * b = 4 * a) (h₃c_eq_4a : 3 * c = 4 * a) (h_a_eq_1 : a = 1) (h_b_eq_4_div_5 : b = 4 / 5) (h_c_eq_4_div_3 : c = 4 / 3) : d = 13 / 15 :=
  by
  have h₄ : d = 13 / 15 := by sorry
  --  exact h₄
  linarith