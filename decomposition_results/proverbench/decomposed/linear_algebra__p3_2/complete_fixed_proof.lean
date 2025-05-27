theorem det_mul (A B : Matrix n n ℝ) : det (A * B) = det A * det B:=
  by
  have h1 : det (1 : Matrix n n ℝ) = 1:= by exact det_identity
    hole
  have h2 : det (A * B) = det A * det B:= by rw [Matrix.det_mul] <;> simp_all
    hole
  exact h2
  hole