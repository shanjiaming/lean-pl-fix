theorem h₂ (n : Type) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (A : Matrix n n ℝ) (inst✝ : Invertible A) (h₁ : (A * A⁻¹).det = det 1) : A.det * A⁻¹.det = 1 := by
  calc
    det A * det A⁻¹ = det (A * A⁻¹) := by rw [det_mul]
    _ = det (1 : Matrix n n ℝ) := by rw [h₁]
    _ = 1 := by rw [det_identity]