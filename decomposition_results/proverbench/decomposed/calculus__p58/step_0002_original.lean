theorem h_main (x : ℝ) : f_deriv x = 0 ↔ x = -2 ∨ x = 3 := by
  constructor
  · intro h
    have h₁ : (6 : ℝ) * x ^ 2 - 6 * x - 36 = 0 := by sorry
    have h₂ : x ^ 2 - x - 6 = 0 := by sorry
    have h₃ : x = -2 ∨ x = 3 := by sorry
    exact h₃
  · intro h
    have h₁ : x = -2 ∨ x = 3 := h
    cases h₁ with
    | inl
      h₁ =>
      have h₂ : f_deriv x = 0 := by
        rw [h₁]
        simp [f_deriv, f_deriv_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] <;> ring_nf <;> norm_num
      exact h₂
    | inr
      h₁ =>
      have h₂ : f_deriv x = 0 := by
        rw [h₁]
        simp [f_deriv, f_deriv_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] <;> ring_nf <;> norm_num
      exact h₂