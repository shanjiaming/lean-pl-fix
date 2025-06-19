theorem multiline_have_test (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    norm_cast
  have h2 : n + n ≥ 
        n + 1 := by
    have h3 : n ≥ 1 := h1
    have h4 : n + n = 
          n + n := rfl
    have h5 : n + 1 ≤ 
        n + n := by
      linarith
    norm_cast
  have h6 : n + 1 ≥ 
      n := by
    norm_num
  norm_num
