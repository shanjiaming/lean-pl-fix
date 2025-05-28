theorem h1₂ (h1₁ : 2 * sin (π / 7) * cos (π / 7) = sin (2 * π / 7)) : 2 * sin (π / 7) * cos (2 * π / 7) = sin (3 * π / 7) - sin (π / 7) :=
  by
  have h1₂₁ :
    2 * Real.sin (Real.pi / 7) * Real.cos (2 * Real.pi / 7) = Real.sin (3 * Real.pi / 7) - Real.sin (Real.pi / 7) := by sorry
  --  linarith
  linarith