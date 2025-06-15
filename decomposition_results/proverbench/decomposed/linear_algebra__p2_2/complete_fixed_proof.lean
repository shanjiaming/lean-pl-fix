theorem matrix_invertibility :
  ∃ (inv : Matrix (Fin 2) (Fin 2) ℝ), A * inv = 1 ∧ inv * A = 1 ∧ A_inv = inv := by
  have h_main : ∃ (inv : Matrix (Fin 2) (Fin 2) ℝ), A * inv = 1 ∧ inv * A = 1 ∧ A_inv = inv := by
    refine' ⟨A_inv, _⟩
    have h₁ : A * A_inv = 1 := verify_inverse.1
    have h₂ : A_inv * A = 1 := verify_inverse.2
    admit
  
  admit