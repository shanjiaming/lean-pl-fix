theorem h_main (x : ℝ) : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
  constructor
  · intro h
    have h₁ : 3 * x ^ 2 - 18 * x + 24 = 0 := by sorry
    have h₂ : x = 2 ∨ x = 4 := by sorry
    exact h₂
  · intro h
    cases h with
    | inl h =>
      have h₁ : x = 2 := h
      rw [h₁]
      norm_num [f_deriv]
    | inr h =>
      have h₁ : x = 4 := h
      rw [h₁]
      norm_num [f_deriv]