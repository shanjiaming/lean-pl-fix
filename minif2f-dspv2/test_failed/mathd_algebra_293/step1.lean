theorem mathd_algebra_293 (x : NNReal) : √(60 * (↑x : ℝ)) * √(12 * (↑x : ℝ)) * √(63 * (↑x : ℝ)) = 36 * (↑x : ℝ) * √(35 * (↑x : ℝ)) :=
  by
  have h₀ :
    Real.sqrt (60 * x) * Real.sqrt (12 * x) * Real.sqrt (63 * x) =
      Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ))) := by sorry
  have h₁ : Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ))) = Real.sqrt (45360 * (x : ℝ) ^ 3) := by sorry
  have h₂ : Real.sqrt (45360 * (x : ℝ) ^ 3) = Real.sqrt ((36 : ℝ) ^ 2 * 35 * (x : ℝ) ^ 3) := by sorry
  have h₃ : Real.sqrt ((36 : ℝ) ^ 2 * 35 * (x : ℝ) ^ 3) = 36 * Real.sqrt (35 * (x : ℝ) ^ 3) := by sorry
  have h₄ : Real.sqrt (35 * (x : ℝ) ^ 3) = (x : ℝ) * Real.sqrt (35 * (x : ℝ)) := by sorry
  have h₅ : 36 * Real.sqrt (35 * (x : ℝ) ^ 3) = 36 * (x : ℝ) * Real.sqrt (35 * (x : ℝ)) := by sorry
  have h₆ : Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ))) = 36 * (x : ℝ) * Real.sqrt (35 * (x : ℝ)) := by sorry
  have h₇ : Real.sqrt (60 * x) * Real.sqrt (12 * x) * Real.sqrt (63 * x) = 36 * x * Real.sqrt (35 * x) := by sorry
  exact h₇