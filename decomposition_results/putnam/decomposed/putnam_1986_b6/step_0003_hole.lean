theorem h₂ (n : ℕ) (npos : n > 0) (F : Type u_1) (inst✝ : Field F) (A B C D : Matrix (Fin n) (Fin n) F) (hsymm : (A * Bᵀ).IsSymm ∧ (C * Dᵀ).IsSymm) (hid h₁ : A * Dᵀ - B * Cᵀ = 1) : A * Dᵀ = 1 + B * Cᵀ := by
  rw [Matrix.ext_iff] at h₁ ⊢
  intro i j
  have h₃ := h₁ i j
  simp [Matrix.sub_apply, Matrix.one_apply, Matrix.add_apply] at h₃ ⊢
  by_cases h₄ : i = j
  · simp_all <;> aesop
  · simp_all <;> aesop
  hole