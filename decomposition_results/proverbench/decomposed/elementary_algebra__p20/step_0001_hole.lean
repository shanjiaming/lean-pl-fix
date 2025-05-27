theorem unique_rational_function_condition (f : ℚ → ℚ) : (f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) ↔ ∀ (x : ℚ), f x = x + 1 :=
  by
  have h_forward : (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) → (∀ x : ℚ, f x = x + 1) := by sorry
  have h_backward : (∀ x : ℚ, f x = x + 1) → (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) := by sorry
  have h_main : (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) ↔ (∀ x : ℚ, f x = x + 1) := by sorry
  --  exact h_main
  hole