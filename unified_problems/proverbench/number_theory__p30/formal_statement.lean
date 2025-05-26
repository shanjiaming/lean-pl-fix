/-- The solutions of x^2 ≡ a (mod p) are ±a^k -/
theorem solutions_of_quadratic_congruence :
  (∀ x : ℤ, x^2 ≡ a [ZMOD p] → (x ≡ a^k [ZMOD p] ∨ x ≡ -a^k [ZMOD p])) ∧
  ((a^k)^2 ≡ a [ZMOD p]) :=