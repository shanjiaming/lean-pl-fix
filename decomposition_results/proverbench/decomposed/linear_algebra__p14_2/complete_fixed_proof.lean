theorem det_inverse (P : Matrix n n K) [Invertible P] : det (P⁻¹) = (det P)⁻¹:=
  by
  have h₀ : det P * det (P⁻¹) = 1:= by
    calc
      det P * det (P⁻¹) = det (P * P⁻¹) := by rw [det_product_eq]
      _ = det (1 : Matrix n n K) := by rw [mul_inv_of_invertible]
      _ = 1 := by simp [det_one]
    hole
  have h₁ : det (P⁻¹) = (det P)⁻¹:=
    by
    have h₂ : det P ≠ 0:= by
      intro h
      rw [h] at h₀
      norm_num at h₀ <;> simp_all [Matrix.det_nonsing_inv] <;> aesop
      hole
    apply inv_eq_of_mul_eq_one_right <;> simpa [h₂] using h₀
    hole
  apply h₁ <;> simp_all [Matrix.det_nonsing_inv] <;> aesop
  hole