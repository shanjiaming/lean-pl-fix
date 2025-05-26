theorem unique_zero_of_f : ∃! x : Z2, IsRoot f x:=
  by
  have h₁ : IsRoot f (1 : Z2):= by
    --  rw [IsRoot]
    exact f_one_eq_zero
    hole
  have h₂ : ∀ (y : Z2), IsRoot f y → y = (1 : Z2):= by
    --  intro y h_y
    have h₃ : y = 0 ∨ y = 1:= by
      --  revert y
      --  decide
      hole
    cases h₃ with
    | inl h₃ =>
      exfalso
      have h₄ : eval y f = 0 := h_y
      rw [h₃] at h₄
      have h₅ : eval (0 : Z2) f ≠ 0 := f_zero_ne_zero
      simp_all [f, eval_add, eval_pow, eval_C, eval_X, pow_two, add_zero, mul_zero] <;> aesop
    | inr h₃ => simp_all [f, eval_add, eval_pow, eval_C, eval_X, pow_two, add_zero, mul_zero] <;> aesop
    hole
  have h₃ : ∃! x : Z2, IsRoot f x:= by
    --  refine' ⟨1, h₁, _⟩
    --  intro y hy
    have h₄ : y = (1 : Z2) := h₂ y hy
    exact h₄
    hole
  --  exact h₃
  hole