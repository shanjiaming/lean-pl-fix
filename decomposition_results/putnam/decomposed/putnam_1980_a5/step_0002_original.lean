theorem h_main (P : Polynomial ℝ) (Pnonconst : P.degree > 0) : {x | 0 = ∫ (t : ℝ) in 0 ..x, Polynomial.eval t P * sin t ∧ 0 = ∫ (t : ℝ) in 0 ..x, Polynomial.eval t P * cos t}.Finite :=
  by
  have h₁ :
    Set.Finite {x : ℝ | 0 = (∫ t in (0)..x, P.eval t * Real.sin t) ∧ 0 = (∫ t in (0)..x, P.eval t * Real.cos t)} := by sorry
  exact h₁