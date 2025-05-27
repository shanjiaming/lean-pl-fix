theorem is_tangent_line  : HasDerivAt f (8 * √3) (π / 3) ∧ f (π / 3) = 8 * √3 * (π / 3 - π / 3) + 4 :=
  by
  have h₁ : HasDerivAt f (8 * Real.sqrt 3) (π / 3) := by sorry
  have h₂ : f (π / 3) = 8 * Real.sqrt 3 * (π / 3 - π / 3) + 4 := by sorry
  --  refine' ⟨h₁, h₂⟩
  norm_cast