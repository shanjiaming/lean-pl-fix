theorem unique_zero_of_f  : ∃! x, f.IsRoot x :=
  by
  have h₁ : IsRoot f (1 : Z2) := by sorry
  have h₂ : ∀ (y : Z2), IsRoot f y → y = (1 : Z2) := by sorry
  have h₃ : ∃! x : Z2, IsRoot f x := by sorry
  --  exact h₃
  simpa