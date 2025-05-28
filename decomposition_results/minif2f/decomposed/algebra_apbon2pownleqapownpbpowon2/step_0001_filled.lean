theorem algebra_apbon2pownleqapownpbpowon2 (a b : ℝ) (n : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : 0 < n) : ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 :=
  by
  have h₂ : 0 < a := by sorry
  have h₃ : 0 < b := by sorry
  have h₄ : 0 < (a + b) / 2 := by sorry
  have h₅ : ∀ (k : ℕ), (a - b) * (a ^ k - b ^ k) ≥ 0 := by sorry
  have h₆ : ((a + b) / 2) ^ n ≤ (a ^ n + b ^ n) / 2 := by sorry
  --  exact h₆
  linarith