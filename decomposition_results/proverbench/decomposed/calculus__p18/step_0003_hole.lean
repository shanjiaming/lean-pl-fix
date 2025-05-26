theorem h₁  : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2 = (∫ (x : ℝ) in Set.Icc 2 8, 1 / x) + ∫ (x : ℝ) in Set.Icc 2 8, x ^ 2 :=
  by
  have h₁₁ : (∫ x in Set.Icc 2 8, (1 / x + x ^ 2 : ℝ)) = ∫ x in Set.Icc 2 8, ((1 / x : ℝ) + (x ^ 2 : ℝ)) := by sorry
  --  rw [h₁₁]
  have h₁₂ :
    (∫ x in Set.Icc 2 8, ((1 / x : ℝ) + (x ^ 2 : ℝ))) =
      (∫ x in Set.Icc 2 8, (1 / x : ℝ)) + ∫ x in Set.Icc 2 8, (x ^ 2 : ℝ) := by sorry
  --  rw [h₁₂]
  hole