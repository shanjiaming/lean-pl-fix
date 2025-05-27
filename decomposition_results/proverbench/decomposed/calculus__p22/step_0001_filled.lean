theorem integral_of_polynomial  : ∫ (x : ℝ) in Set.Icc 3 9, f x = 216 :=
  by
  have h₁ : (∫ x in Set.Icc 3 9, f x) = 216 := by sorry
  --  exact h₁
  linarith