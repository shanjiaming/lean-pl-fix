theorem h₃ (A : Matrix (Fin 2) (Fin 2) ℝ) (h₁ : (A * A).det = A.det ^ 2) : 0 ≤ A.det ^ 2 := by -- nlinarith [sq_nonneg (det A)]
  nlinarith