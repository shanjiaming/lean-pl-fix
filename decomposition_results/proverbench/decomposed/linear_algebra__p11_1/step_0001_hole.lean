theorem det_A_sq (A : Matrix (Fin 2) (Fin 2) ℝ) : (A * A).det = A.det ^ 2 :=
  by
  have h_main : det (A * A) = det A * det A := by sorry
  have h_final : det (A * A) = (det A) ^ 2 := by sorry
  --  exact h_final
  hole