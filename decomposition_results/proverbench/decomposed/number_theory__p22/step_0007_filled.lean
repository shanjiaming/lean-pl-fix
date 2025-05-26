theorem h₄ (p q : ℤ) (hq : ¬q = 0) (r : ℚ) (hr : cos ((↑p : ℝ) * π / (↑q : ℝ)) = (↑r : ℝ)) : (↑r : ℝ) = cos ((↑p : ℝ) * π / (↑q : ℝ)) := by -- rw [hr] <;> norm_cast
  linarith