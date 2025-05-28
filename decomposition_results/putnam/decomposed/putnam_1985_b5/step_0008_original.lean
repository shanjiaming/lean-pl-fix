theorem h9 (fact h2 h3 h4 h5 h7 h8 : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) : ∫ (x : ℝ) in univ, rexp (-x ^ 2) > √π :=
  by
  have h10 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) > Real.sqrt Real.pi := by sorry
  exact h10