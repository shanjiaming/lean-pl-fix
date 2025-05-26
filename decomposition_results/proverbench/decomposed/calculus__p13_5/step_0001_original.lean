theorem is_tangent_line  : HasDerivAt sorry (8 * √3) (π / 3) ∧ sorry = 8 * √3 * (π / 3 - π / 3) + 4 :=
  by
  have h₁ : HasDerivAt f (8 * Real.sqrt 3) (π / 3) := by sorry
  have h₂ : f (π / 3) = 8 * Real.sqrt 3 * (π / 3 - π / 3) + 4 := by sorry
  refine' ⟨h₁, h₂⟩