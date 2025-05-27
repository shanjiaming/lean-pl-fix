theorem matrix_invertibility  : ∃ inv, A * inv = 1 ∧ inv * A = 1 ∧ A_inv = inv :=
  by
  have h_main : ∃ (inv : Matrix (Fin 2) (Fin 2) ℝ), A * inv = 1 ∧ inv * A = 1 ∧ A_inv = inv := by sorry
  --  exact h_main
  norm_cast