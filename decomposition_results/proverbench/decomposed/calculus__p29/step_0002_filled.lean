theorem h_main (x : ℝ) : ∫ (y : ℝ) in Set.Icc 0 x, 1 / (y ^ 2 + 1) = arctan x - arctan 0 :=
  by
  have h₁ : (∫ y in Set.Icc 0 x, (1 : ℝ) / (y ^ 2 + 1)) = arctan x - arctan 0 := by sorry
  --  exact h₁
  linarith