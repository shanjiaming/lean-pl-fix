theorem det_A : det A = -32 := by
  have h₀ : det A = -32 := by
    rw [A]
    -- Compute the determinant using the `det_succ_row_zero` formula.
    -- This formula expands the determinant along the first row.
    simp [Matrix.det_succ_row_zero, Fin.sum_univ_succ, Fin.val_zero, Matrix.det_fin_three]
    -- Simplify the expression using basic arithmetic.
    <;> norm_num
    <;> ring
    <;> rfl
  
  apply h₀