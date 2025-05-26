/-- The equation can be rewritten as 2cos(2x + π/3) = √2 -/
lemma simplified_equation (x : ℝ) :
  equation x = 2 * Real.cos (2 * x + Real.pi / 3) - Real.sqrt 2 :=