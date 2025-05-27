theorem h2 (G : Set (ℝ × ℝ × ℝ)) (hG : G = {p | p.2.2 = 7 - p.1 ^ 2 - p.2.1 ^ 2 ∧ p.2.2 ≥ 0}) (h1 :  ∫ (x : ℝ) in Set.Icc (-√7) √7,      ∫ (y : ℝ) in Set.Icc (-√(7 - x ^ 2)) √(7 - x ^ 2), x ^ 2 + y ^ 2 + 2 * (7 - x ^ 2 - y ^ 2) =    147 / 2 * Real.pi) : (957 * √29 - 47) / 20 * Real.pi ≠ 147 / 2 * Real.pi :=
  by
  --  intro h
  have h₃ : (957 * Real.sqrt 29 - 47) / 20 = (147 : ℝ) / 2 := by sorry
  have h₄ : 957 * Real.sqrt 29 - 47 = 147 * 10 := by sorry
  have h₅ : Real.sqrt 29 > 0 := Real.sqrt_pos.mpr (by norm_num)
  have h₆ : Real.sqrt 29 > 5 := by sorry
  have h₇ : Real.sqrt 29 < 6 := by sorry
  --  nlinarith [Real.sq_sqrt (show 0 ≤ 29 by norm_num), Real.pi_gt_three]
  linarith