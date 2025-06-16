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
      rw [Matrix.ext_iff] at h₁ ⊢
      intro i j
      have h₃ := h₁ i j
      simp [Matrix.sub_apply, Matrix.one_apply, Matrix.add_apply] at h₃ ⊢
      by_cases h₄ : i = j
      · simp_all
        <;>
        aesop
      · simp_all
        <;>
        aesop
    exact h₂
  
  have h2 : D * Aᵀ = 1 + C * Bᵀ := by
    have h2 : (A * Dᵀ)ᵀ = (1 + B * Cᵀ)ᵀ := by rw [h1]
    have h3 : D * Aᵀ = 1 + C * Bᵀ := by
      calc
        D * Aᵀ = (A * Dᵀ)ᵀ := by
          simp [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;> congr <;> ext i j <;> simp [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          simp_all [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          simp_all [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
        _ = (1 + B * Cᵀ)ᵀ := by rw [h2]
        _ = 1 + C * Bᵀ := by
          simp [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero, add_comm]
          <;> congr <;> ext i j <;> simp [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          simp_all [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
          <;>
          ring_nf
          <;>
          simp_all [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ, Fin.sum_univ_zero]
    exact h3
  
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
              calc
                Dᵀ * A - Bᵀ * C = (D * Aᵀ)ᵀ - (C * Bᵀ)ᵀ := by
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
                _ = (1 + C * Bᵀ)ᵀ - (C * Bᵀ)ᵀ := by rw [h40]
                _ = 1 := by
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
            exact h41
          calc
            (Dᵀ * A - Bᵀ * C)ᵀ = 1ᵀ := by rw [h4]
            _ = 1 := by simp
    exact h3
  
  exact h3