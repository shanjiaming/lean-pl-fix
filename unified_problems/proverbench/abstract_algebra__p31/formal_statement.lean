theorem polynomial_divisibility_by_quadratic (n : ℕ) :
  ((P ∣ Q) ↔ ∃ i : ℕ, n = 6 * i - 1 )∧ (∀ n : ℕ, ¬ (P ∣ R)) :=