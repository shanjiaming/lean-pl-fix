/-- Main theorem: all prime divisors are of the form 24k + 1 -/
theorem prime_divisors_of_polynomial_form (p : ℕ) (hp : Prime p) (h : p ∣ Polynomialn n) :
  ∃ k : ℕ, p = 24 * k + 1 :=