theorem polynomial_value_based_on_parity:
(n % 2 = 0 → P.eval (n + 2 : R) = 2 / (n + 2 : R)) ∧ (n % 2 ≠ 0 → P.eval (n + 2 : R) = 0) :=