theorem det_identity : det (1 : Matrix n n ℝ) = 1 := by
  have h : det (1 : Matrix n n ℝ) = 1 := by
    -- Use the existing lemma `Matrix.det_one` which states that the determinant of the identity matrix is 1.
    exact Matrix.det_one
  -- The statement follows directly from the established fact `h`.
  exact h