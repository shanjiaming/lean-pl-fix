lemma second_derivative_test (x : ℝ) (h : f_deriv x = 0) :
  (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by
  have h_cases : x = 2 ∨ x = 4 := by
    have h₁ : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := critical_points x
    have h₂ : x = 2 ∨ x = 4 := by
      apply (h₁.mp h)
    exact h₂
  
  have h_main : (x = 2 ∧ f_second_deriv x < 0) ∨ (x = 4 ∧ f_second_deriv x > 0) := by
    cases h_cases with
    | inl h₂ =>
      -- Case: x = 2
      have h₃ : x = 2 := h₂
      have h₄ : f_second_deriv x = 6 * x - 18 := rfl
      have h₅ : f_second_deriv x < 0 := by
        rw [h₄, h₃]
        norm_num [f_second_deriv]
      exact Or.inl ⟨h₃, h₅⟩
    | inr h₂ =>
      -- Case: x = 4
      have h₃ : x = 4 := h₂
      have h₄ : f_second_deriv x = 6 * x - 18 := rfl
      have h₅ : f_second_deriv x > 0 := by
        rw [h₄, h₃]
        norm_num [f_second_deriv]
      exact Or.inr ⟨h₃, h₅⟩
  
  exact h_main