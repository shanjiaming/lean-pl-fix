theorem h_div (a : ℕ → ℤ) (abase : a 0 = 1 ∧ a 1 = 2) (arec : ∀ n ≥ 2, a n = 4 * a (n - 1) - a (n - 2)) (h_odd : Odd 181) (h_prime : Nat.Prime 181) : ↑181 ∣ a 2015 :=
  by
  have h₁ : ((181 : ℕ) : ℤ) ∣ a 2015 := by sorry
  --  exact h₁
  hole