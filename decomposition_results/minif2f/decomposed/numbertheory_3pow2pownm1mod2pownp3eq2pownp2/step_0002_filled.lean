theorem h_main (n : ℕ) (h₀ : 0 < n) : ∃ k, 3 ^ 2 ^ n = 1 + 2 ^ (n + 2) + k * 2 ^ (n + 3) :=
  by
  have h₁ : ∀ n : ℕ, 0 < n → ∃ (k : ℕ), 3 ^ 2 ^ n = 1 + 2 ^ (n + 2) + k * 2 ^ (n + 3) := by sorry
  --  exact h₁ n h₀
  hole