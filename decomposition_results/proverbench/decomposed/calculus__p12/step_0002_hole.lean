theorem h (x : ℝ) (hx : x ≠ 3 ∧ x ≠ -3) : False := by
  have h₁ : x ≠ 3 := hx.1
  have h₂ : x ≠ -3 := hx.2
  have h₃ : x = 3 ∨ x = -3 := by sorry
  --  cases h₃ with
  --  | inl h₃ => exact h₁ h₃
  --  | inr h₃ => exact h₂ h₃
  hole