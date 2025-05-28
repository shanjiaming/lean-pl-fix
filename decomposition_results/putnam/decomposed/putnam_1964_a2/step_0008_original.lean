theorem h₇₄ (α : ℝ) (f : ℝ → ℝ) (hf :  f ∈    {f |      (∀ x ∈ Icc 0 1, f x > 0) ∧        ContinuousOn f (Icc 0 1) ∧          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2}) (h₁ : ∀ x ∈ Icc 0 1, f x > 0) (h₂ : ContinuousOn f (Icc 0 1)) (h₃ : ∫ (x : ℝ) in 0 ..1, f x = 1) (h₄ : ∫ (x : ℝ) in 0 ..1, x * f x = α) (h₅ : ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2) (h₆ : ∫ (x : ℝ) in 0 ..1, (x - α) ^ 2 * f x = 0) (h₇₁ : ContinuousOn (fun x => (x - α) ^ 2 * f x) (Icc 0 1)) (h₇₂ : ∫ (x : ℝ) in 0 ..1, (x - α) ^ 2 * f x = 0) (h₇₃ : ∀ x ∈ Icc 0 1, (x - α) ^ 2 * f x ≥ 0) : ∀ x ∈ Icc 0 1, (x - α) ^ 2 * f x = 0 := by
  by_contra h
  push_neg at h
  obtain ⟨x, hx, hx'⟩ := h
  have h₇₅ : 0 < (x - α) ^ 2 * f x :=
    by
    have h₇₅₁ : (x - α) ^ 2 * f x > 0 := by
      have h₇₅₂ : f x > 0 := h₁ x hx
      have h₇₅₃ : (x - α) ^ 2 ≥ 0 := by nlinarith
      have h₇₅₄ : (x - α) ^ 2 * f x > 0 := by positivity
      exact h₇₅₄
    linarith
  have h₇₆ : ∫ x in (0)..1, (x - α) ^ 2 * f x > 0 :=
    by
    have h₇₆₁ : ContinuousOn (fun x => (x - α) ^ 2 * f x) (Icc 0 1) := h₇₁
    have h₇₆₂ : ∃ c ∈ Icc 0 1, (c - α) ^ 2 * f c > 0 := by exact ⟨x, hx, h₇₅⟩
    have h₇₆₃ : ∫ x in (0)..1, (x - α) ^ 2 * f x > 0 :=
      by
      have h₇₆₄ : ContinuousOn (fun x => (x - α) ^ 2 * f x) (Icc 0 1) := h₇₁
      have h₇₆₅ : ∃ c ∈ Icc 0 1, (c - α) ^ 2 * f c > 0 := h₇₆₂
      have h₇₆₆ : ∫ x in (0)..1, (x - α) ^ 2 * f x > 0 := by apply?
      exact h₇₆₆
    exact h₇₆₃
  linarith