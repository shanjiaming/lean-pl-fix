theorem main (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (hB' : Bᵀ ≠ 0) (hB'A' : Bᵀ * Aᵀ = 0) : ¬LinearIndependent ℝ fun i => Bᵀ i :=
  by
  have h₁ : ¬LinearIndependent ℝ (fun i => Bᵀ i) := by sorry
  exact h₁