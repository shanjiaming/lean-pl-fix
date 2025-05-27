theorem polynomial_condition :
  (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) ↔
    ∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n:=
  by
  have h_imp :
    (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) →
      (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := by sorry
  have h_rev :
    (P ≠ 0) →
      ((∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) →
        (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n)) := by sorry
  have h_zero : (P = 0) → (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) → False:=
    by
    --  intro hP h
    have h₁ := h 0
    have h₂ := h 1
    have h₃ := h (-1)
    have h₄ := h 2
    have h₅ := h (-2)
    have h₆ := h 3
    have h₇ := h (-3)
    have h₈ := h 4
    have h₉ := h (-4)
    --  simp [hP, eval_zero, eval_one, eval_mul, eval_add, eval_pow, eval_X, eval_C, eval_sub,
    --        eval_pow] at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ <;>
    --      norm_num at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ <;>
    --    linarith
    hole
  --  by_cases hP : P = 0
  --  · constructor
  --    · intro h
  --      exfalso
      have h₁ : (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := h
      have h₂ : False := h_zero hP h₁
  --      exfalso
  --      exact h₂
  --    · intro h
  --      exfalso
  --      rcases h with ⟨n, hn⟩
      have h₁ : P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n := hn
      have h₂ : P = 0 := hP
  --      rw [h₂] at h₁
      have h₃ : (0 : Polynomial ℝ) = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n:= by simpa using h₁
        hole
      have h₄ : (0 : Polynomial ℝ) ≠ (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n:=
        by
        intro h₅
        have h₆ := congr_arg (fun p => Polynomial.eval 0 p) h₅
        simp [Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_C, div_eq_mul_inv] at h₆ <;>
                  ring_nf at h₆ ⊢ <;>
                norm_num at h₆ ⊢ <;>
              simp_all [Polynomial.eval_mul, Polynomial.eval_pow, Polynomial.eval_X, Polynomial.eval_C, div_eq_mul_inv] <;>
            ring_nf at h₆ ⊢ <;>
          norm_num at h₆ ⊢
        hole
  --      exact h₄ h₃
  --  · constructor
  --    · intro h
      have h₁ : (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := h
      have h₂ : (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n):=
        by
        have h₃ : (P ≠ 0) := hP
        --  exact h_rev h₃ h₁
        hole
  --      exact h₂
  --    · intro h
      have h₁ : (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) := h
      have h₂ : (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := by sorry
  --      exact h₂
  hole