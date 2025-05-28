theorem h10 (fact h2 h3 h4 h5 h7 h8 : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) : ∫ (x : ℝ) in univ, rexp (-x ^ 2) > √π :=
  by
  have h11 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) = Real.sqrt Real.pi := by sorry
  have h12 : Real.sqrt Real.pi > 0 := Real.sqrt_pos.mpr (by positivity)
  have h13 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) > Real.sqrt Real.pi := by sorry
  --  exact h13
  hole