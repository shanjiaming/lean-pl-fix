theorem unique_zero_of_f : ∃! x : Z2, IsRoot f x := by
  have h₁ : IsRoot f (1 : Z2) := by
    rw [IsRoot]
    exact f_one_eq_zero
  
  have h₂ : ∀ (y : Z2), IsRoot f y → y = (1 : Z2) := by
    intro y h_y
    -- We need to show that if y is a root of f, then y must be 1.
    -- Since y is in Z2, it can only be 0 or 1.
    have h₃ : y = 0 ∨ y = 1 := by
      revert y
      decide
    -- We consider the two possible cases for y.
    cases h₃ with
    | inl h₃ =>
      -- Case 1: y = 0.
      -- If y = 0, then f(y) = f(0) = 0^2 + 1 = 1 ≠ 0, which contradicts the assumption that y is a root of f.
      exfalso
      have h₄ : eval y f = 0 := h_y
      rw [h₃] at h₄
      -- Simplify f(0) to 1.
      have h₅ : eval (0 : Z2) f ≠ 0 := f_zero_ne_zero
      -- Since f(0) = 1 ≠ 0, we have a contradiction.
      simp_all [f, eval_add, eval_pow, eval_C, eval_X, pow_two, add_zero, mul_zero]
      -- Simplifying f(0) to 1 confirms the contradiction.
      <;> aesop
    | inr h₃ =>
      -- Case 2: y = 1.
      -- If y = 1, then f(y) = f(1) = 1^2 + 1 = 0, which is consistent with y being a root of f.
      simp_all [f, eval_add, eval_pow, eval_C, eval_X, pow_two, add_zero, mul_zero]
      -- Simplifying f(1) to 0 confirms that y = 1 is indeed a root of f.
      <;> aesop
  
  have h₃ : ∃! x : Z2, IsRoot f x := by
    refine' ⟨1, h₁, _⟩
    -- We need to show that 1 is the only root of f in Z2.
    intro y hy
    -- Let y be a root of f in Z2.
    have h₄ : y = (1 : Z2) := h₂ y hy
    -- By the second hypothesis, y must be 1.
    exact h₄
  
  exact h₃