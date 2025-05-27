theorem h1 (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (h : Bᵀ = 0) : B = 0 := by
  have h2 : Bᵀ = 0 := h
  have h3 : B = 0 := by sorry
  exact h3