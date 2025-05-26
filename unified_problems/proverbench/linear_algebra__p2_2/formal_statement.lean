/-- Theorem: A is invertible and A⁻¹ is its inverse -/
theorem matrix_invertibility :
  ∃ (inv : Matrix (Fin 2) (Fin 2) ℝ), A * inv = 1 ∧ inv * A = 1 ∧ A_inv = inv :=