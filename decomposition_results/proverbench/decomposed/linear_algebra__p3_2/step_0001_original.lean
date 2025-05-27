theorem det_mul (n : Type) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A B : Matrix n n ℝ) : (A * B).det = A.det * B.det :=
  by
  have h1 : det (1 : Matrix n n ℝ) = 1 := by sorry
  have h2 : det (A * B) = det A * det B := by sorry
  exact h2