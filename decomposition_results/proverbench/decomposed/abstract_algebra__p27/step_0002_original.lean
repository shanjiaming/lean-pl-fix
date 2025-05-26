theorem h_main (a : sorry) (b : sorry) (h : sorry) : a = 0 ∨ b = 0 := by
  by_cases h₀ : a = 0
  · exact Or.inl h₀
  ·
    have h₁ : b = 0 := by sorry
    exact Or.inr h₁