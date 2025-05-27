theorem critical_points : f_deriv x = 0 ↔ x = 2 ∨ x = 4:=
  by
  have h_main : f_deriv x = 0 ↔ x = 2 ∨ x = 4:= by
    --  constructor
    --  · intro h
      have h₁ : 3 * x ^ 2 - 18 * x + 24 = 0:= by
        --  simp only [f_deriv] at h ⊢
        --  linarith
        simpa
      have h₂ : x = 2 ∨ x = 4:= by
        have h₃ : x ^ 2 - 6 * x + 8 = 0:= by -- nlinarith
          linarith
        have h₄ : (x - 2) * (x - 4) = 0:= by -- nlinarith
          linarith
        have h₅ : x - 2 = 0 ∨ x - 4 = 0:= by -- apply eq_zero_or_eq_zero_of_mul_eq_zero h₄
          hole
        --  cases h₅ with
        --  | inl h₅ =>
        --    have h₆ : x = 2 := by linarith
        --    exact Or.inl h₆
        --  | inr h₅ =>
        --    have h₆ : x = 4 := by linarith
        --    exact Or.inr h₆
        hole
    --    exact h₂
    --  · intro h
    --    cases h with
    --    | inl h =>
    --      have h₁ : x = 2 := h
    --      rw [h₁]
    --      norm_num [f_deriv]
    --    | inr h =>
    --      have h₁ : x = 4 := h
    --      rw [h₁]
    --      norm_num [f_deriv]
    hole
  --  exact h_main
  simpa