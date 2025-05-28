theorem h₇₃ (α : ℝ) (f : ℝ → ℝ) (hf :  f ∈    {f |      (∀ x ∈ Icc 0 1, f x > 0) ∧        ContinuousOn f (Icc 0 1) ∧          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2}) (h₁ : ∀ x ∈ Icc 0 1, f x > 0) (h₂ : ContinuousOn f (Icc 0 1)) (h₃ : ∫ (x : ℝ) in 0 ..1, f x = 1) (h₄ : ∫ (x : ℝ) in 0 ..1, x * f x = α) (h₅ : ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2) (h₆ : ∫ (x : ℝ) in 0 ..1, (x - α) ^ 2 * f x = 0) (h₇₁ : ContinuousOn (fun x => (x - α) ^ 2 * f x) (Icc 0 1)) (h₇₂ : ∫ (x : ℝ) in 0 ..1, (x - α) ^ 2 * f x = 0) : ∀ x ∈ Icc 0 1, (x - α) ^ 2 * f x ≥ 0 := by
  intro x hx
  have h₇₄ : f x > 0 := h₁ x hx
  have h₇₅ : (x - α) ^ 2 ≥ 0 := by sorry
  nlinarith
  hole