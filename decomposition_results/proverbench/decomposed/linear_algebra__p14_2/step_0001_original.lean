theorem det_inverse (n : Type u) (inst✝³ : Fintype n) (inst✝² : DecidableEq n) (K : Type u_1) (inst✝¹ : Field K) (P : Matrix n n K) (inst✝ : Invertible P) : P⁻¹.det = P.det⁻¹ :=
  by
  have h₀ : det P * det (P⁻¹) = 1 := by sorry
  have h₁ : det (P⁻¹) = (det P)⁻¹ := by sorry
  apply h₁ <;> simp_all [Matrix.det_nonsing_inv] <;> aesop