theorem h₁ (A : Matrix (Fin 2) (Fin 2) ℝ) : (A * A).det = A.det ^ 2 := by
  --  rw [det_A_sq] <;> simp [pow_two] <;> ring <;> simp [Matrix.det_fin_two] <;> ring
  hole