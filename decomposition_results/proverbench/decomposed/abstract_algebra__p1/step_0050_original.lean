theorem h₆ (P : Polynomial ℤ) (z : ℤ) (hz : Polynomial.eval z P = 0) (a b c : ℤ) (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c) (hP_a : Polynomial.eval a P = 1) (hP_b : Polynomial.eval b P = -1) (hP_c : Polynomial.eval c P = 1) (h₁ : a - z = 1 ∨ a - z = -1) (h₂ : b - z = 1 ∨ b - z = -1) (h₃ : c - z = 1 ∨ c - z = -1) (h₄ : a = z + 1 ∨ a = z - 1) (h₅ : b = z + 1 ∨ b = z - 1) : c = z + 1 ∨ c = z - 1 := by
  cases h₃ with
  | inl h₃ =>
    have h₆₁ : c - z = 1 := h₃
    have h₆₂ : c = z + 1 := by linarith
    exact Or.inl h₆₂
  | inr h₃ =>
    have h₆₁ : c - z = -1 := h₃
    have h₆₂ : c = z - 1 := by linarith
    exact Or.inr h₆₂