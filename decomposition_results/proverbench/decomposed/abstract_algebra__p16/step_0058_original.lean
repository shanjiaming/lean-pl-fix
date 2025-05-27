theorem h₄ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h_constant h₁ : P.degree ≤ 0) (c : ℝ) (hc : P = C c) (h₃ : ∀ (x : ℝ), eval x P = c) : c ^ 2 - 1 = 4 * c := by
  have h₅ := h 0
  have h₆ := h 1
  have h₇ := h (-2)
  have h₈ := h 2
  have h₉ := h 3
  simp [h₃] at h₅ h₆ h₇ h₈ h₉ <;> ring_nf at h₅ h₆ h₇ h₈ h₉ ⊢ <;>
    nlinarith [Real.sqrt_nonneg 5, Real.sq_sqrt (show 0 ≤ 5 by norm_num)]