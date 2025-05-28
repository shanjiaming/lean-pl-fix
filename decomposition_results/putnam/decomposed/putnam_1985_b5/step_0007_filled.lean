theorem h8 (fact h2 h3 h4 h5 h7 : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π := by -- simpa using h7
  linarith