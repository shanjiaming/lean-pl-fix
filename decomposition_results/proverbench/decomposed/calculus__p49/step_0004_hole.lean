theorem h₁₁  : ∫ (x : ℝ) in Set.Icc (-1) 1, x ^ 2 / (1 + x ^ 2) = ∫ (x : ℝ) in Set.Icc (-1) 1, 1 - 1 / (1 + x ^ 2) :=
  by
  --  congr
  --  ext x
  have h₁₂ : x ^ 2 / (1 + x ^ 2 : ℝ) = 1 - 1 / (1 + x ^ 2 : ℝ) := by sorry
  --  rw [h₁₂]
  hole