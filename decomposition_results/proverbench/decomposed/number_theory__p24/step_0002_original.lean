theorem h₁ (a : ℕ) (d : optParam ℤ ((↑a : ℤ) ^ 2 - 1)) (x y : ℤ) (m : optParam ℤ (x ^ 2 - d * y ^ 2)) (h₀ : |m| < 2 * (↑a : ℤ) + 2) : a = 0 ∨ a ≥ 1 := by
  by_cases h : a = 0
  · exact Or.inl h
  ·
    exact
      Or.inr
        (by
          have h₂ : a ≥ 1 := by
            have h₃ : a ≠ 0 := h
            have h₄ : a > 0 := Nat.pos_of_ne_zero h₃
            omega
          exact h₂)