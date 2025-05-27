theorem hB' (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) : Bᵀ ≠ 0 := by
  intro h
  apply hB
  have h1 : B = 0 := by sorry
  exact h1