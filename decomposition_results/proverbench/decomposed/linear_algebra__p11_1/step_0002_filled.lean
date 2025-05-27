theorem h_main (A : Matrix (Fin 2) (Fin 2) ℝ) : (A * A).det = A.det * A.det := by
  --  rw [Matrix.det_mul] <;> simp [Matrix.det_fin_two] <;> ring <;> simp_all [Matrix.mul_apply, Fin.sum_univ_succ] <;>
        ring <;>
      simp_all [Matrix.mul_apply, Fin.sum_univ_succ] <;>
    ring
  hole