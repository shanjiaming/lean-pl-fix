theorem h2 (n : Type) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A B : Matrix n n ℝ) (h1 : det 1 = 1) : (A * B).det = A.det * B.det := by rw [Matrix.det_mul] <;> simp_all
  hole