theorem h₂ (L : (Fin 3 → ℝ) →ₗ[ℝ] Fin 2 → ℝ) (K : (Fin 2 → ℝ) →ₗ[ℝ] Fin 4 → ℝ) (h₀ : matrixM 0 0 = 37) (h₁ : matrixM 1 1 = 1) : matrixM 2 2 = -24 := by
  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
  hole