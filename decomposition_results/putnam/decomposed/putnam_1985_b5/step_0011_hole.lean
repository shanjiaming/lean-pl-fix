theorem h13 (fact h2 h3 h4 h5 h7 h8 h11 : ∫ (x : ℝ) in univ, rexp (-x ^ 2) = √π) (h12 : √π > 0) : ∫ (x : ℝ) in univ, rexp (-x ^ 2) > √π :=
  by
  have h14 : ∫ x : ℝ in Set.univ, Real.exp (-x ^ 2) > Real.sqrt Real.pi := by sorry
  --  exact h14
  hole