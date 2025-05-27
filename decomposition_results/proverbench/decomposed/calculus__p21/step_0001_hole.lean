theorem max_value_of_function_under_constraint (x y z : ℝ) : x ^ 2 + y ^ 2 + z ^ 2 = 1 → f (x, y, z) ≤ 1 ∧ (f (x, y, z) = 1 ↔ x = 1 / √3 ∧ y = 1 / √3 ∧ z = 1 / √3) :=
  by
  --  intro h
  have h₀ : f (x, y, z) ≤ 1 := by sorry
  have h₁ : (f (x, y, z) = 1 ↔ x = 1 / Real.sqrt 3 ∧ y = 1 / Real.sqrt 3 ∧ z = 1 / Real.sqrt 3) := by sorry
  --  exact ⟨h₀, h₁⟩
  hole