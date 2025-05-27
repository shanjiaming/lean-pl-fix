theorem h2 (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (hB' : Bᵀ ≠ 0) (h1 : (Bᵀ * Aᵀ)ᵀ = 0) : Bᵀ * Aᵀ = 0 := by
  have h3 : (Bᵀ * Aᵀ)ᵀ = 0 := h1
  have h4 : Bᵀ * Aᵀ = 0 := by sorry
  exact h4