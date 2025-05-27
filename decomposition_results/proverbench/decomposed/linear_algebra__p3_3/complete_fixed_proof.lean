theorem det_inv (A : Matrix n n ℝ) [Invertible A] : det A⁻¹ = (det A)⁻¹:=
  by
  have h₁ : det (A * A⁻¹) = det (1 : Matrix n n ℝ):= by rw [mul_inv_of_invertible] <;> simp [det_identity]
    hole
  have h₂ : det A * det A⁻¹ = 1:= by
    calc
      det A * det A⁻¹ = det (A * A⁻¹) := by rw [det_mul]
      _ = det (1 : Matrix n n ℝ) := by rw [h₁]
      _ = 1 := by rw [det_identity]
    hole
  have h₃ : det A⁻¹ = (det A)⁻¹:=
    by
    have h₄ : det A ≠ 0:= by
      by_contra h
      have h₅ : det A = 0:= by simpa using h
        hole
      have h₆ : det A * det A⁻¹ = 0:= by
        rw [h₅]
        simp
        hole
      rw [h₂] at h₆
      norm_num at h₆
      hole
    apply mul_left_cancel₀ h₄
    rw [← h₂] <;> ring_nf <;> field_simp [h₄] <;> ring_nf <;> linarith
    hole
  exact h₃
  hole