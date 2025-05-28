theorem h₅ (d : ℕ → ℕ) (h₀ : d 0 = 0) (h₁ : d 1 = 0) (h₂ : d 2 = 1) (h₃ : ∀ n ≥ 3, d n = d (n - 1) + d (n - 3)) (h₄ :  ∀ (n : ℕ),    (n % 7 = 0 → d n % 2 = 0) ∧      (n % 7 = 1 → d n % 2 = 0) ∧        (n % 7 = 2 → d n % 2 = 1) ∧          (n % 7 = 3 → d n % 2 = 1) ∧ (n % 7 = 4 → d n % 2 = 1) ∧ (n % 7 = 5 → d n % 2 = 0) ∧ (n % 7 = 6 → d n % 2 = 1)) : Even (d 2021) := by
  have h₅₁ := h₄ 2021
  have h₅₂ : 2021 % 7 = 5 := by sorry
  have h₅₃ : d 2021 % 2 = 0 := by sorry
  have h₅₄ : Even (d 2021) := by sorry
  --  exact h₅₄
  simpa