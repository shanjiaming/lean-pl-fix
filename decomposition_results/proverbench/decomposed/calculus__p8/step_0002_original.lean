theorem h1 (G : Set (ℝ × ℝ × ℝ)) (hG : G = {p | p.2.2 = 7 - p.1 ^ 2 - p.2.1 ^ 2 ∧ p.2.2 ≥ 0}) : ∫ (x : ℝ) in Set.Icc (-√7) √7,
      ∫ (y : ℝ) in Set.Icc (-√(7 - x ^ 2)) √(7 - x ^ 2), x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2) =
    147 / 2 * Real.pi :=
  by sorry