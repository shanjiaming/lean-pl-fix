theorem h₁ (x : NNReal) : √(60 * (↑x : ℝ)) * √(12 * (↑x : ℝ)) * √(63 * (↑x : ℝ)) = √(60 * (↑x : ℝ) * (12 * (↑x : ℝ)) * (63 * (↑x : ℝ))) :=
  by
  have h₂ : 0 ≤ (60 : ℝ) * (x : ℝ) := by sorry
  have h₃ : 0 ≤ (12 : ℝ) * (x : ℝ) := by sorry
  have h₄ : 0 ≤ (63 : ℝ) * (x : ℝ) := by sorry
  have h₅ : 0 ≤ (60 : ℝ) * (x : ℝ) * (12 * (x : ℝ)) := by sorry
  have h₆ : 0 ≤ (60 : ℝ) * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ)) := by sorry
  have h₇ : Real.sqrt (60 * (x : ℝ)) * Real.sqrt (12 * (x : ℝ)) = Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ))) := by sorry
  rw [h₇]
  have h₈ :
    Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ))) * Real.sqrt (63 * (x : ℝ)) =
      Real.sqrt (60 * (x : ℝ) * (12 * (x : ℝ)) * (63 * (x : ℝ))) := by sorry
  rw [h₈]