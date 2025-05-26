theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r : ℚ, cos (p * π / q) = r) :
  ∃ r : ℚ, r ∈ ({0, 1, -1, 1/2, -1/2} : Set ℚ) ∧ cos (p * π / q) = r :=