theorem mathd_numbertheory_247 (n : ℕ) (h₀ : 3 * n % 11 = 2) : n % 11 = 8 :=
  by
  have h₁ : n % 11 = 8 := by sorry
  --  exact h₁
  linarith