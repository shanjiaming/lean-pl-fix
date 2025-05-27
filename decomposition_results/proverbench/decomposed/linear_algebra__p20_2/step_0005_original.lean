theorem h5 (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (h h2 h4 : Bᵀ = 0) : B = 0 := by
  ext i j
  have h6 := congr_fun (congr_fun h4 j) i
  simp [Matrix.transpose_apply] at h6 ⊢ <;> aesop