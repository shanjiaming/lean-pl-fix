theorem h₆ (h₂ : equation 0 = 1) : equation 0 = 2 * Real.cos (2 * 0 + Real.pi / 3) - √2 :=
  by
  have h₇ : equation 0 = 2 * Real.cos (2 * (0 : ℝ) + Real.pi / 3) - Real.sqrt 2 := by sorry
  --  rw [h₇]
  linarith