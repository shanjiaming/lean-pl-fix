theorem h₃ (p : ℕ) (hp : Prime p) (N : ℕ := ∏ k ∈ range (p - 1), (k ^ 2 + 1)) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) : p = 5 → N % p = 0 := by
  --  intro h
  have h₄ : p = 5 := h
  have h₅ : N = 100 := by sorry
  have h₆ : N % p = 100 % 5 := by sorry
  have h₇ : N % p = 0 := by sorry
  --  exact h₇
  hole