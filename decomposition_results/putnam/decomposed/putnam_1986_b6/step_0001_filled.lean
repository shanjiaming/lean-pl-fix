theorem putnam_1986_b6 (n : ℕ) (npos : n > 0) (F : Type u_1) (inst✝ : Field F) (A B C D : Matrix (Fin n) (Fin n) F) (hsymm : (A * Bᵀ).IsSymm ∧ (C * Dᵀ).IsSymm) (hid : A * Dᵀ - B * Cᵀ = 1) : Aᵀ * D - Cᵀ * B = 1 :=
  by
  have h1 : A * Dᵀ = 1 + B * Cᵀ := by sorry
  have h2 : D * Aᵀ = 1 + C * Bᵀ := by sorry
  have h3 : Aᵀ * D - Cᵀ * B = 1 := by sorry
  exact h3
  hole