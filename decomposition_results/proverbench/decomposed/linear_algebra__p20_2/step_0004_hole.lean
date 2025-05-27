theorem h3 (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (h h2 : Bᵀ = 0) : B = 0 := by
  have h4 : Bᵀ = 0 := h2
  have h5 : B = 0 := by sorry
  --  exact h5
  hole