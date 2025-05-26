theorem h₄ (n : ℕ) (h1 : n % 7 = 5) (h2 : n % 9 = 3) (h3 : n % 11 = 7) : n % 63 = 12 :=
  by
  have h₄₁ : n % 63 = 12 := by sorry
  --  exact h₄₁
  linarith