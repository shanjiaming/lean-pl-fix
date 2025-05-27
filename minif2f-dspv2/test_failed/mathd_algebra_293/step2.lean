theorem h₀ (x : NNReal) : √(60 * (↑x : ℝ)) * √(12 * (↑x : ℝ)) * √(63 * (↑x : ℝ)) = √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ))) :=
  by
  have h₁ :
    Real.sqrt (60 * (x : ℝ)) * Real.sqrt (12 * (x : ℝ)) * Real.sqrt (63 * (x : ℝ)) =
      Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ))) := by sorry
  have h₉ : Real.sqrt (60 * x) = Real.sqrt (60 * (x : ℝ)) := by sorry
  have h₁₀ : Real.sqrt (12 * x) = Real.sqrt (12 * (x : ℝ)) := by sorry
  have h₁₁ : Real.sqrt (63 * x) = Real.sqrt (63 * (x : ℝ)) := by sorry
  rw [h₉, h₁₀, h₁₁]
  exact h₁