theorem critical_points : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
  have h_main : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
    constructor
    · -- Prove the forward direction: if f_deriv x = 0, then x = 2 or x = 4
      intro h
      have h₁ : 3 * x ^ 2 - 18 * x + 24 = 0 := by
        -- Simplify f_deriv x = 0 to 3x² - 18x + 24 = 0
        simp only [f_deriv] at h ⊢
        linarith
      have h₂ : x = 2 ∨ x = 4 := by
        -- Solve the quadratic equation 3x² - 18x + 24 = 0
        have h₃ : x ^ 2 - 6 * x + 8 = 0 := by
          -- Divide the equation by 3 to simplify to x² - 6x + 8 = 0
          nlinarith
        have h₄ : (x - 2) * (x - 4) = 0 := by
          -- Factor the quadratic equation
          nlinarith
        -- Use the fact that if (x - 2)(x - 4) = 0, then x = 2 or x = 4
        have h₅ : x - 2 = 0 ∨ x - 4 = 0 := by
          apply eq_zero_or_eq_zero_of_mul_eq_zero h₄
        cases h₅ with
        | inl h₅ =>
          -- Case: x - 2 = 0
          have h₆ : x = 2 := by linarith
          exact Or.inl h₆
        | inr h₅ =>
          -- Case: x - 4 = 0
          have h₆ : x = 4 := by linarith
          exact Or.inr h₆
      exact h₂
    · -- Prove the reverse direction: if x = 2 or x = 4, then f_deriv x = 0
      intro h
      cases h with
      | inl h =>
        -- Case: x = 2
        have h₁ : x = 2 := h
        rw [h₁]
        -- Substitute x = 2 into f_deriv x to verify it is zero
        norm_num [f_deriv]
      | inr h =>
        -- Case: x = 4
        have h₁ : x = 4 := h
        rw [h₁]
        -- Substitute x = 4 into f_deriv x to verify it is zero
        norm_num [f_deriv]
  exact h_main