theorem prime_divisors_of_polynomial_form :
  ∀ p : ℕ, p.Prime → p ∣ n^4 - n^2 + 1 → ∃ k : ℕ, p = 12 * k + 1 :=