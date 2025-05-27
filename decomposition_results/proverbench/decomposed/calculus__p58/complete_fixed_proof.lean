theorem verify_critical_values : ∀ x, critical_values_of_cubic x:=
  by
  --  intro x
  have h_main : (f_deriv x = 0 ↔ x = -2 ∨ x = 3):= by
    --  constructor
    --  · intro h
      have h₁ : (6 : ℝ) * x ^ 2 - 6 * x - 36 = 0:= by
        --  --  simp [f_deriv, f_deriv_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] at h ⊢ <;> ring_nf at h ⊢ <;>
        --    linarith
        hole
      have h₂ : x ^ 2 - x - 6 = 0:= by -- nlinarith
        linarith
      have h₃ : x = -2 ∨ x = 3:= by
        have h₄ : (x + 2) * (x - 3) = 0:= by -- nlinarith
          linarith
        have h₅ : x + 2 = 0 ∨ x - 3 = 0:= by -- apply eq_zero_or_eq_zero_of_mul_eq_zero h₄
          hole
        --  cases h₅ with
        --  | inl h₅ =>
        --    have h₆ : x = -2 := by linarith
        --    exact Or.inl h₆
        --  | inr h₅ =>
        --    have h₆ : x = 3 := by linarith
        --    exact Or.inr h₆
        hole
    --    exact h₃
    --  · intro h
      have h₁ : x = -2 ∨ x = 3 := h
    --    cases h₁ with
    --    | inl
    --      h₁ =>
    --      have h₂ : f_deriv x = 0 := by
    --        rw [h₁]
    --        simp [f_deriv, f_deriv_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] <;> ring_nf <;> norm_num
    --      exact h₂
    --    | inr
    --      h₁ =>
    --      have h₂ : f_deriv x = 0 := by
    --        rw [h₁]
    --        simp [f_deriv, f_deriv_poly, eval_sub, eval_add, eval_mul, eval_pow, eval_C, eval_X] <;> ring_nf <;> norm_num
    --      exact h₂
    hole
  --  exact h_main
  hole