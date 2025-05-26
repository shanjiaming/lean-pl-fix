theorem tangent_line_equation  : ∀ (x y : ℝ), y = 8 * √3 * (x - π / 3) + 4 ↔ y - sorry = 2 * (1 / cos (π / 3)) ^ 2 * tan (π / 3) * (x - π / 3) :=
  by
  --  intro x y
  have h_main :
    (y = 8 * Real.sqrt 3 * (x - π / 3) + 4) ↔
      (y - f (π / 3) = (2 * (1 / Real.cos (π / 3)) ^ 2 * Real.tan (π / 3)) * (x - π / 3)) := by sorry
  --  exact h_main
  hole