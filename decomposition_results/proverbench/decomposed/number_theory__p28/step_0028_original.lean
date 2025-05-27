theorem h₈ (p : ℕ) (hp : Prime p) (N : ℕ := ∏ k ∈ range (p - 1), (k ^ 2 + 1)) (h₁ : p = 2 → N % p = 0) (h₂ : p = 3 → N % p = 4) (h₃ : p = 5 → N % p = 0) (h₄ : p = 7 → N % p = 4) (h₅ : p = 11 → N % p = 4) (h h₇ : p % 4 = 3) : p = 3 := by
  have h₉ := Nat.Prime.eq_two_or_odd hp
  cases h₉ with
  | inl h₉ =>
    exfalso
    have h₁₀ : p = 2 := h₉
    have h₁₁ : p % 4 = 2 := by omega
    omega
  | inr h₉ =>
    have h₁₀ : p % 2 = 1 := h₉
    have h₁₁ : p % 4 = 3 := h₇
    have h₁₂ : p = 3 := by omega
    exact h₁₂