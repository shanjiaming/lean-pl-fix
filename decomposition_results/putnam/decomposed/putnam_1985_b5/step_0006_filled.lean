theorem h6 (fact h2 h3 h4 h5 : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) : False := by
  have h7 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) = Real.sqrt π := h5
  have h8 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) = Real.sqrt Real.pi := by sorry
  have h9 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) > Real.sqrt Real.pi := by sorry
  have h10 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) > Real.sqrt Real.pi := h9
  have h11 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) = Real.sqrt Real.pi := by sorry
  --  linarith
  linarith