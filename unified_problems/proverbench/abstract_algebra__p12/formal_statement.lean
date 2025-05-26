theorem unique_polynomial_with_remainders :
  (∀ x, (P %ₘ (X - 1)^3).eval x = -1) ∧ (∀ x, (P %ₘ (X + 1)^3).eval x = 1) →
  P = -C (3/8) * X^5 + C (5/4) * X^3 - C (15/8) * X :=