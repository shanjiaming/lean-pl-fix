theorem h5 (fact h2 h3 h4 : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π := by -- simpa using h4
  linarith