theorem h1 (fact : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) : False := by
  have h2 : ∫ x in univ, exp (-x ^ 2) = sqrt (Real.pi) := fact
  have h3 : ∫ x in univ, exp (-x ^ 2) = Real.sqrt π := by sorry
  have h4 : ∫ x in univ, Real.exp (-x ^ 2) = Real.sqrt π := by sorry
  have h5 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) = Real.sqrt π := by sorry
  have h6 : False := by sorry
  exact h6