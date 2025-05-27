theorem h_final (A : Matrix (Fin 2) (Fin 2) ℝ) (h_main : (A * A).det = A.det * A.det) : (A * A).det = A.det ^ 2 := by -- -- rw [h_main] <;> ring
  linarith