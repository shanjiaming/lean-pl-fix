theorem h1 (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (hB' : Bᵀ ≠ 0) : (Bᵀ * Aᵀ)ᵀ = 0 := by
  --  calc
  --    (Bᵀ * Aᵀ)ᵀ = A * B := by rw [Matrix.mul_transpose, Matrix.transpose_transpose] <;> rw [Matrix.transpose_transpose]
  --    _ = 0 := hAB
  simpa