theorem h_imp (P : ℝ[X]) : (∃ n, P = 16 * (X /ₘ 4) ^ n) → ∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2 :=
  by
  --  intro h
  --  obtain ⟨n, rfl⟩ := h
  --  intro x
  have h₁ :
    eval (x ^ 2) ((16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) =
      (16 : ℝ) * (eval (x ^ 2) ((Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n)) := by sorry
  have h₂ :
    eval (2 * x) ((16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) =
      (16 : ℝ) * (eval (2 * x) ((Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n)) := by sorry
  --  rw [h₁, h₂]
  have h₃ : eval (x ^ 2) ((Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) = ((x ^ 2 / 4 : ℝ) ^ n) := by sorry
  have h₄ : eval (2 * x) ((Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n) = ((2 * x / 4 : ℝ) ^ n) := by sorry
  --  rw [h₃, h₄]
  have h₅ : (16 : ℝ) * ((x ^ 2 / 4 : ℝ) ^ n) = (16 : ℝ) * ((x ^ 2 / 4 : ℝ) ^ n) := by sorry
  --  rw [h₅]
  have h₆ : ((16 : ℝ) * ((2 * x / 4 : ℝ) ^ n)) ^ 2 = (16 : ℝ) ^ 2 * ((2 * x / 4 : ℝ) ^ n) ^ 2 := by sorry
  have h₇ : (16 : ℝ) * ((x ^ 2 / 4 : ℝ) ^ n) = (16 : ℝ) ^ 2 * ((2 * x / 4 : ℝ) ^ n) ^ 2 := by sorry
  --  nlinarith
  hole