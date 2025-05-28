theorem h₇ (F : ℕ → ℕ) (hF : ∀ (n : ℕ), F (n + 2) = F (n + 1) + F n) (F01 : F 0 = 0 ∧ F 1 = 1) (h₁ : F 2 = 1) (h₂ : ∀ n ≥ 1, F n ≥ 1) (h₃ : ∀ m > 2, F m ≥ 2) (m : ℕ) (hm : m > 2) (h₅ : m ≥ 3) (h₆ : F m ≥ 2) : F m - 1 ≥ 1 := by
  have h₇₁ : F m ≥ 2 := h₆
  --  omega
  omega