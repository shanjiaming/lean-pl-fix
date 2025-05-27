theorem det_A_sq_nonneg (A : Matrix (Fin 2) (Fin 2) ℝ) : (A * A).det ≥ 0 :=
  by
  have h₁ : det (A * A) = (det A) ^ 2 := by sorry
  have h₂ : (det A) ^ 2 ≥ 0 :=
    by
    have h₃ : 0 ≤ (det A) ^ 2 := by nlinarith [sq_nonneg (det A)]
    linarith
  have h₃ : det (A * A) ≥ 0 := by sorry
  have h₂ : (det A) ^ 2 ≥ 0 := by sorry
have det_A_sq_nonneg : det (A * A) ≥ 0 :=
  by
  have h₁ : det (A * A) = (det A) ^ 2 := by sorry
  have h₂ : (det A) ^ 2 ≥ 0 :=
    by
    have h₃ : 0 ≤ (det A) ^ 2 := by nlinarith [sq_nonneg (det A)]
    linarith
  have h₃ : det (A * A) ≥ 0 := by
    rw [h₁]
    exact h₂
  exact h₃