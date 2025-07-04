theorem putnam_1986_b6
(n : ℕ)
(npos : n > 0)
(F : Type*) [Field F]
(A B C D : Matrix (Fin n) (Fin n) F)
(hsymm : IsSymm (A * Bᵀ) ∧ IsSymm (C * Dᵀ))
(hid : A * Dᵀ - B * Cᵀ = 1)
: (Aᵀ * D - Cᵀ * B = 1) := by
  have h1 : A * Dᵀ = 1 + B * Cᵀ := by
    have h₁ : A * Dᵀ - B * Cᵀ = 1 := hid
    have h₂ : A * Dᵀ = 1 + B * Cᵀ := by
      admit
    omega
  
  have h2 : D * Aᵀ = 1 + C * Bᵀ := by
    have h2 : (A * Dᵀ)ᵀ = (1 + B * Cᵀ)ᵀ := by admit
    have h3 : D * Aᵀ = 1 + C * Bᵀ := by
      admit
    omega
  
  have h3 : Aᵀ * D - Cᵀ * B = 1 := by
    have h3 : Aᵀ * D - Cᵀ * B = 1 := by
      calc
        Aᵀ * D - Cᵀ * B = (Dᵀ * A)ᵀ - (Bᵀ * C)ᵀ := by
          simp [Matrix.mul_apply, Matrix.transpose_apply, Matrix.sub_apply]
          <;>
          congr <;>
          ext i j <;>
          simp [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          simp_all [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          linarith
        _ = (Dᵀ * A - Bᵀ * C)ᵀ := by
          simp [Matrix.mul_apply, Matrix.transpose_apply, Matrix.sub_apply]
          <;>
          congr <;>
          ext i j <;>
          simp [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          simp_all [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          linarith
        _ = 1 := by
          have h4 : Dᵀ * A - Bᵀ * C = 1 := by
            have h40 : D * Aᵀ = 1 + C * Bᵀ := h2
            have h41 : Dᵀ * A - Bᵀ * C = 1 := by
              admit
            omega
          calc
            (Dᵀ * A - Bᵀ * C)ᵀ = 1ᵀ := by rw [h4]
            _ = 1 := by simp
    omega
  
  omega
