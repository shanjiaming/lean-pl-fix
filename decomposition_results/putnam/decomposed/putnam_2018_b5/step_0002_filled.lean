theorem h_det_pos (f : (Fin 2 → ℝ) → Fin 2 → ℝ) (h₁ : ContDiff ℝ 1 f) (h₂ : ∀ (x : Fin 2 → ℝ) (i j : Fin 2), 0 < (fderiv ℝ f x) (Pi.single i 1) j) (h₃ :  ∀ (x : Fin 2 → ℝ),    0 <      (fderiv ℝ f x) ![1, 0] 0 * (fderiv ℝ f x) ![0, 1] 1 -        1 / 4 * ((fderiv ℝ f x) ![1, 0] 1 + (fderiv ℝ f x) ![0, 1] 0) ^ 2) : ∀ (x : Fin 2 → ℝ),
    (fderiv ℝ f x) ![1, 0] 0 * (fderiv ℝ f x) ![0, 1] 1 - (fderiv ℝ f x) ![1, 0] 1 * (fderiv ℝ f x) ![0, 1] 0 > 0 :=
  by
  --  intro x
  have h₄ :
    0 <
      fderiv ℝ f x ![1, 0] 0 * fderiv ℝ f x ![0, 1] 1 -
        (1 / 4) * (fderiv ℝ f x ![1, 0] 1 + fderiv ℝ f x ![0, 1] 0) ^ 2 :=
    h₃ x
  have h₅ : 0 < fderiv ℝ f x ![1, 0] 0 := h₂ x 0 0
  have h₆ : 0 < fderiv ℝ f x ![1, 0] 1 := h₂ x 0 1
  have h₇ : 0 < fderiv ℝ f x ![0, 1] 0 := h₂ x 1 0
  have h₈ : 0 < fderiv ℝ f x ![0, 1] 1 := h₂ x 1 1
  have h₉ :
    (fderiv ℝ f x ![1, 0] 1 + fderiv ℝ f x ![0, 1] 0) ^ 2 ≥ 4 * (fderiv ℝ f x ![1, 0] 1 * fderiv ℝ f x ![0, 1] 0) := by sorry
  have h₁₀ : fderiv ℝ f x ![1, 0] 0 * fderiv ℝ f x ![0, 1] 1 - fderiv ℝ f x ![1, 0] 1 * fderiv ℝ f x ![0, 1] 0 > 0 := by sorry
  --  exact h₁₀
  hole