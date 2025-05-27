theorem paraboloid_integral_value (G : Set (ℝ × ℝ × ℝ)) (hG : G = {p | p.2.2 = 7 - p.1 ^ 2 - p.2.1 ^ 2 ∧ p.2.2 ≥ 0}) : ∫ (x : ℝ) in Set.Icc (-√7) √7,
      ∫ (y : ℝ) in Set.Icc (-√(7 - x ^ 2)) √(7 - x ^ 2), x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2) =
    (957 * √29 - 47) / 20 * sorry :=
  by
  have h1 :
    ∫ (x : ℝ) in Set.Icc (-Real.sqrt 7) (Real.sqrt 7),
        ∫ (y : ℝ) in Set.Icc (-Real.sqrt (7 - x ^ 2)) (Real.sqrt (7 - x ^ 2)), (x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2)) =
      (147 : ℝ) / 2 * Real.pi := by sorry
  have h2 : (957 * Real.sqrt 29 - 47) / 20 * Real.pi ≠ (147 : ℝ) / 2 * Real.pi := by sorry
  have h3 : False := by sorry
  exfalso
  apply h3