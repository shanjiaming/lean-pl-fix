theorem h₁ (m n p : ℕ) (A : Matrix (Fin m) (Fin n) ℝ) (B : Matrix (Fin n) (Fin p) ℝ) (hAB : A * B = 0) (hB : B ≠ 0) (hB' : Bᵀ ≠ 0) (hB'A' : Bᵀ * Aᵀ = 0) : ¬LinearIndependent ℝ fun i => Bᵀ i := by
  --  by_contra h₂
  have h₃ : LinearIndependent ℝ (fun i => Bᵀ i) := h₂
  --  have h₄ := null_space_non_trivial (A := Bᵀ) (B := Aᵀ) hB'A' hB' h₃ <;> simp_all
  hole