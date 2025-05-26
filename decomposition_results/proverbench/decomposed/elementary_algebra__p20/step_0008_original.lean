theorem h_backward (h_forward : sorry = 2 ∧ (ℚ → ℚ → sorry = sorry * sorry - sorry + 1) → ∀ (x : ℚ), sorry = x + 1) : (∀ (x : ℚ), sorry = x + 1) → sorry = 2 ∧ (ℚ → ℚ → sorry = sorry * sorry - sorry + 1) :=
  by
  intro hf
  have h1 : f 1 = 2 := by sorry
  have h2 : ∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1 := by sorry
  exact ⟨h1, h2⟩