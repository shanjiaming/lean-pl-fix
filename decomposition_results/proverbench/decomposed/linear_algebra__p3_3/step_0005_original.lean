theorem h₄ (n : Type) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (A : Matrix n n ℝ) (inst✝ : Invertible A) (h₁ : (A * A⁻¹).det = det 1) (h₂ : A.det * A⁻¹.det = 1) : A.det ≠ 0 := by
  by_contra h
  have h₅ : det A = 0 := by sorry
  have h₆ : det A * det A⁻¹ = 0 := by sorry
  rw [h₂] at h₆
  norm_num at h₆