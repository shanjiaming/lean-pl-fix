theorem h₇ (n : ℕ) (h₀ : 2 ≤ n) (h₁ : ∃ x, x ^ 3 = n) (ht : 2 ^ 4 = n) (h₃ : 2 ≥ 2) (h : ¬2 ≥ 8) (h₅ : 2 ≤ 7) : n = 16 := by -- -- norm_num at ht ⊢ <;> linarith
  hole