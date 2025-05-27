theorem h₄ (h₁ : 2.5 - 2 ≠ 0) (h₃ : (heightFunction 2.5 - heightFunction 2) / (2.5 - 2) = -32) : heightFunction 2.5 - heightFunction 2 = -32 * (2.5 - 2) :=
  by
  have h₅ : (heightFunction 2.5 - heightFunction 2 : ℝ) = -32 * (2.5 - 2 : ℝ) := by sorry
  --  exact h₅
  linarith