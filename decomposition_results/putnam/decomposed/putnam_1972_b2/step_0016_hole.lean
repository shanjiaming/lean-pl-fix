theorem h₄ (s v : ℝ) (hs : s > 0) (hv : v > 0) (valid : ℝ → (ℝ → ℝ) → Prop) (hvalid :  ∀ (t : ℝ) (x : ℝ → ℝ),    valid t x ↔      DifferentiableOn ℝ x (Set.Icc 0 t) ∧        DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) ∧          AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s) (h₁ : 2 * s / v ∈ {t | ∃ x, valid t x}) (t : ℝ) (x : ℝ → ℝ) (hx : valid t x) (h₃₁ : DifferentiableOn ℝ x (Set.Icc 0 t)) (h₃₂ : DifferentiableOn ℝ (deriv x) (Set.Icc 0 t)) (h₃₃ : AntitoneOn (deriv (deriv x)) (Set.Icc 0 t)) (h₃₄ : deriv x 0 = 0) (h₃₅ : deriv x t = v) (h₃₆ : x t - x 0 = s) : t ≤ 2 * s / v := by
  --  by_contra h
  have h₅ : t > 2 * s / v := by sorry
  have h₆ : deriv x 0 = 0 := h₃₄
  have h₇ : deriv x t = v := h₃₅
  have h₈ : x t - x 0 = s := h₃₆
  have h₉ : AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) := h₃₃
  have h₁₀ : DifferentiableOn ℝ x (Set.Icc 0 t) := h₃₁
  have h₁₁ : DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) := h₃₂
  have h₁₂ : ∀ u ∈ Set.Icc 0 t, deriv x u ≥ (u / t) * v := by sorry
  have h₁₃ : x t - x 0 ≥ s := by sorry
  have h₁₄ : x t - x 0 < s := by sorry
  --  linarith
  hole