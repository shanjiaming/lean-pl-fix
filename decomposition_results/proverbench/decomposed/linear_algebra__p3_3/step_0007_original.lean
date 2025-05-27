theorem h₆ (n : Type) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (A : Matrix n n ℝ) (inst✝ : Invertible A) (h₁ : (A * A⁻¹).det = det 1) (h₂ : A.det * A⁻¹.det = 1) (h h₅ : A.det = 0) : A.det * A⁻¹.det = 0 := by
  rw [h₅]
  simp