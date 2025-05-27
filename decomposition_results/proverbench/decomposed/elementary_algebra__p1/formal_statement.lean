theorem polynomial_parity_evaluation :
  (n % 2 = 0 → P.eval ((n + 1) : ℤ) = 1) ∧ (n % 2 ≠ 0 → P.eval ((n + 1) : ℤ) = 0) :=