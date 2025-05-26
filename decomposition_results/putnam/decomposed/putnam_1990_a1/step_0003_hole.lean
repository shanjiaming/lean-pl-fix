theorem h₁ (T : ℕ → ℤ) (hT012 : T 0 = 2 ∧ T 1 = 3 ∧ T 2 = 6) (hTn : ∀ (n : ℕ), T (n + 3) = ((↑n : ℤ) + 7) * T (n + 2) - 4 * ((↑n : ℤ) + 3) * T (n + 1) + (4 * (↑n : ℤ) + 4) * T n) (n : ℕ) : T n = (↑n ! : ℤ) + 2 ^ n :=
  by
  have h₂ : ∀ n : ℕ, T n = (n ! : ℤ) + (2 : ℤ) ^ n := by sorry
  --  exact h₂ n
  hole