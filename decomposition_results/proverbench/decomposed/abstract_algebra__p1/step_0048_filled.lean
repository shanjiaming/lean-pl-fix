theorem h₄ (P : Polynomial ℤ) (z : ℤ) (hz : Polynomial.eval z P = 0) (a b c : ℤ) (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c) (hP_a : Polynomial.eval a P = 1) (hP_b : Polynomial.eval b P = -1) (hP_c : Polynomial.eval c P = 1) (h₁ : a - z = 1 ∨ a - z = -1) (h₂ : b - z = 1 ∨ b - z = -1) (h₃ : c - z = 1 ∨ c - z = -1) : a = z + 1 ∨ a = z - 1 := by
  --  cases h₁ with
  --  | inl h₁ =>
  --    have h₄₁ : a - z = 1 := h₁
  --    have h₄₂ : a = z + 1 := by linarith
  --    exact Or.inl h₄₂
  --  | inr h₁ =>
  --    have h₄₁ : a - z = -1 := h₁
  --    have h₄₂ : a = z - 1 := by linarith
  --    exact Or.inr h₄₂
  omega