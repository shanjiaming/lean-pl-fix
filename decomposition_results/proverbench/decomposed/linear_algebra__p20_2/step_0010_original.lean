theorem h6 (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (hB' : Bᵀ ≠ 0) (h1 h3 h5 : (Bᵀ * Aᵀ)ᵀ = 0) : Bᵀ * Aᵀ = 0 := by
  rw [← Matrix.transpose_transpose (Bᵀ * Aᵀ)]
  rw [h5] <;> simp