theorem h₃ (a : ℕ → ℤ) (abase : a 0 = 1 ∧ a 1 = 2) (arec : ∀ n ≥ 2, a n = 4 * a (n - 1) - a (n - 2)) (h_odd : Odd 181) (h_prime : Nat.Prime 181) : ∀ (n : ℕ), a n % 181 = a (n % 20) % 181 :=
  by
  --  intro n
  have h₄ : ∀ n : ℕ, a n % (181 : ℤ) = a (n % 20) % (181 : ℤ) := by sorry
  --  exact h₄ n
  simpa