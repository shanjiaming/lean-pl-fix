macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem curveLength_integral :
∫ (t : ℝ) in Set.Icc 0 1, integrand t = ∫ (t : ℝ) in Set.Icc 0 1, Real.sqrt (1 + (4 + 4 * Real.pi ^ 2) * t ^ 2) := by
  have h_main : (∫ (t : ℝ) in Set.Icc 0 1, integrand t) = ∫ (t : ℝ) in Set.Icc 0 1, Real.sqrt (1 + (4 + 4 * Real.pi ^ 2) * t ^ 2) := by
    hole_2
  
  hole_1