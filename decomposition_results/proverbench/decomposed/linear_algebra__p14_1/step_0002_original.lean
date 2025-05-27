theorem h (n : Type u) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (K : Type u_1) (inst✝ : Field K) (X Y : Matrix n n K) : (X * Y).det = X.det * Y.det := by
  rw [Matrix.det_mul] <;> simp [mul_comm, mul_assoc, mul_left_comm] <;> ring <;> simp_all [Matrix.det_mul] <;> ring <;>
      simp_all [Matrix.det_mul] <;>
    ring