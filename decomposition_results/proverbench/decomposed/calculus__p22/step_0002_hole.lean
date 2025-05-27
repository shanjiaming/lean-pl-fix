theorem h₁  : ∫ (x : ℝ) in Set.Icc 3 9, f x = 216 :=
  by
  have h₂ : (∫ x in Set.Icc 3 9, f x) = (∫ x in (3 : ℝ)..9, f x) := by sorry
  --  rw [h₂]
  have h₃ : (∫ x in (3 : ℝ)..9, f x) = 216 := by sorry
  --  rw [h₃]
  hole