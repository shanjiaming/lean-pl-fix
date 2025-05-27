theorem h_backward (r : ℝ) (h_forward : given_equation r → r = 7) : r = 7 → given_equation r := by
  --  intro h
  have h₁ : r = (7 : ℝ) := h
  have h₂ : (2 : ℝ) = (-12 : ℝ) + 2 * (r : ℝ) := by sorry
  --  exact h₂
  hole