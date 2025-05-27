theorem h₁ (p : ℕ) (hp : Prime p) (N : ℕ := ∏ k ∈ range (p - 1), (k ^ 2 + 1)) : p = 2 → N % p = 0 := by
  intro h
  have h₂ : p = 2 := h
  have h₃ : N = 1 := by sorry
  have h₄ : N % p = 1 % 2 := by sorry
  have h₅ : N % p = 1 := by sorry
  have h₆ : N % p = 0 := by sorry
  exact h₆