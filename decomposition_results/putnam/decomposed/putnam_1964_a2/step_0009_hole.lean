theorem h₈ (α : ℝ) (f : ℝ → ℝ) (hf :  f ∈    {f |      (∀ x ∈ Icc 0 1, f x > 0) ∧        ContinuousOn f (Icc 0 1) ∧          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2}) (h₁ : ∀ x ∈ Icc 0 1, f x > 0) (h₂ : ContinuousOn f (Icc 0 1)) (h₃ : ∫ (x : ℝ) in 0 ..1, f x = 1) (h₄ : ∫ (x : ℝ) in 0 ..1, x * f x = α) (h₅ : ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2) (h₆ : ∫ (x : ℝ) in 0 ..1, (x - α) ^ 2 * f x = 0) (h₇ : ∀ x ∈ Icc 0 1, (x - α) ^ 2 * f x = 0) : ∀ x ∈ Icc 0 1, x = α := by
  intro x hx
  have h₈₁ : (x - α) ^ 2 * f x = 0 := h₇ x hx
  have h₈₂ : f x > 0 := h₁ x hx
  have h₈₃ : (x - α) ^ 2 = 0 := by sorry
  have h₈₆ : x - α = 0 := by sorry
  linarith
  hole