theorem det_inv (n : Type) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (A : Matrix n n ℝ) (inst✝ : Invertible A) : A⁻¹.det = A.det⁻¹ :=
  by
  have h₁ : det (A * A⁻¹) = det (1 : Matrix n n ℝ) := by sorry
  have h₂ : det A * det A⁻¹ = 1 := by sorry
  have h₃ : det A⁻¹ = (det A)⁻¹ := by sorry
  exact h₃