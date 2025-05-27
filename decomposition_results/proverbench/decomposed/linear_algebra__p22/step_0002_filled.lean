theorem h₀ (L : (Fin 3 → ℝ) →ₗ[ℝ] Fin 2 → ℝ) (K : (Fin 2 → ℝ) →ₗ[ℝ] Fin 4 → ℝ) : matrixM 0 0 = 37 := by
  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
  norm_cast