theorem field_is_integral_domain (a b : F) (h : a * b = 0) : a = 0 ∨ b = 0 := by
  have h_main : a = 0 ∨ b = 0 := by
    by_cases h₀ : a = 0
    · -- Case 1: a = 0
      exact Or.inl h₀
    · -- Case 2: a ≠ 0
      have h₁ : b = 0 := by
        -- Use the cancellation property of multiplication by a non-zero element
        have h₂ : a * b = a * 0 := by simp [h]
        -- Apply the cancellation property to deduce b = 0
        have h₃ : b = 0 := mul_left_cancel₀ h₀ h₂
        exact h₃
      exact Or.inr h₁
  exact h_main