theorem odd_divisors_of_polynomial_congruence_mod_20 (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 :=
  by
  have hd_not_div_five : (d : ℤ) % 5 ≠ 0 := by sorry
  have h_main : (d : ℤ) % 20 = 1 ∨ (d : ℤ) % 20 = 3 ∨ (d : ℤ) % 20 = 7 ∨ (d : ℤ) % 20 = 9 := by sorry
  have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by sorry
  --  tauto
  hole