theorem h₂ (A : Matrix (Fin 2) (Fin 2) ℝ) (h₁ : (A * A).det = A.det ^ 2) : A.det ^ 2 ≥ 0 := by
  have h₃ : 0 ≤ (det A) ^ 2 := by sorry
  --  linarith
  linarith