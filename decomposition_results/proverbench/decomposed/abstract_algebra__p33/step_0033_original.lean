theorem h_zero (P : ℝ[X]) (h_imp : (∃ n, P = 16 * (X /ₘ 4) ^ n) → ∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2) (h_rev : P ≠ 0 → (∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2) → ∃ n, P = 16 * (X /ₘ 4) ^ n) : P = 0 → (∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2) → False :=
  by
  intro hP h
  have h₁ := h 0
  have h₂ := h 1
  have h₃ := h (-1)
  have h₄ := h 2
  have h₅ := h (-2)
  have h₆ := h 3
  have h₇ := h (-3)
  have h₈ := h 4
  have h₉ := h (-4)
  simp [hP, eval_zero, eval_one, eval_mul, eval_add, eval_pow, eval_X, eval_C, eval_sub,
        eval_pow] at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ <;>
      norm_num at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ <;>
    linarith