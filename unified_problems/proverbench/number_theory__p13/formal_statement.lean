theorem odd_divisors_of_polynomial_congruence_mod_20 (d x : ℤ) (hd : d ∣ 5 * x^2 + 1) (h_odd : Odd d) :
  d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 :=