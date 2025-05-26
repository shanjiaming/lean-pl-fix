theorem h_forward  : sorry = 2 ∧ (ℚ → ℚ → sorry = sorry * sorry - sorry + 1) → ∀ (x : ℚ), sorry = x + 1 :=
  by
  --  intro h
  have h₁ : f 1 = 2 := h.1
  have h₂ : ∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1 := h.2
  have h₃ : f 0 = 1 := by sorry
  have h₄ : ∀ (x : ℚ), f (x + 1) = f x + 1 := by sorry
  have h₅ : ∀ (n : ℤ) (x : ℚ), f (x + n) = f x + n := by sorry
  have h₆ : ∀ (x : ℚ), f x = x + 1 := by sorry
  --  exact h₆
  hole