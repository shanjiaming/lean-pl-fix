theorem h_backward (f : ℚ → ℚ) (h_forward : (f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) → ∀ (x : ℚ), f x = x + 1) : (∀ (x : ℚ), f x = x + 1) → f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1 :=
  by
  intro hf
  have h1 : f 1 = 2 := by sorry
  have h2 : ∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1 := by sorry
  exact ⟨h1, h2⟩