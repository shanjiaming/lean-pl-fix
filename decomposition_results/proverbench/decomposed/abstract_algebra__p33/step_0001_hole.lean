theorem polynomial_condition (P : ℝ[X]) : (∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2) ↔ ∃ n, P = 16 * (X /ₘ 4) ^ n :=
  by
  have h_imp :
    (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) →
      (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := by sorry
  have h_rev :
    (P ≠ 0) →
      ((∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) →
        (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n)) := by sorry
  have h_zero : (P = 0) → (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) → False := by sorry
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
      have h₃ : (0 : Polynomial ℝ) = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n := by sorry
      have h₄ : (0 : Polynomial ℝ) ≠ (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n := by sorry
  --      exact h₄ h₃
  --  · constructor
  --    · intro h
      have h₁ : (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := h
      have h₂ : (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) := by sorry
  --      exact h₂
  --    · intro h
      have h₁ : (∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) := h
      have h₂ : (∀ x : ℝ, 16 * eval (x ^ 2) P = (eval (2 * x) P) ^ 2) := by sorry
  --      exact h₂
  hole