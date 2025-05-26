theorem polynomial_evaluation_modulo_property :
  (∀ i : ℕ, i ≤ n → P.eval (i : ℤ) = i % 2) ∧
((n % 2 = 1 → P.eval ((n + 1 : ℕ) : ℤ) = 2^n) ∧ (n % 2 = 0 → P.eval ((n + 1 : ℕ) : ℤ) = 1 - 2^n)) :=