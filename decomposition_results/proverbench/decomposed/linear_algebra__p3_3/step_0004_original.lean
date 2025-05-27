theorem h₃ (n : Type) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (A : Matrix n n ℝ) (inst✝ : Invertible A) (h₁ : (A * A⁻¹).det = det 1) (h₂ : A.det * A⁻¹.det = 1) : A⁻¹.det = A.det⁻¹ :=
  by
  have h₄ : det A ≠ 0 := by sorry
  apply mul_left_cancel₀ h₄
  rw [← h₂] <;> ring_nf <;> field_simp [h₄] <;> ring_nf <;> linarith