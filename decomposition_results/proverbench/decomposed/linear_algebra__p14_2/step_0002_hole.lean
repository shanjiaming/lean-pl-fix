theorem h₀ (n : Type u) (inst✝³ : Fintype n) (inst✝² : DecidableEq n) (K : Type u_1) (inst✝¹ : Field K) (P : Matrix n n K) (inst✝ : Invertible P) : P.det * P⁻¹.det = 1 := by
  calc
    det P * det (P⁻¹) = det (P * P⁻¹) := by rw [det_product_eq]
    _ = det (1 : Matrix n n K) := by rw [mul_inv_of_invertible]
    _ = 1 := by simp [det_one]
  hole