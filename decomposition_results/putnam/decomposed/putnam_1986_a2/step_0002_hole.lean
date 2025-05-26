theorem h_main  : ⌊10 ^ 20000 / (10 ^ 100 + 3)⌋₊ % 10 = 3 :=
  by
  have h₁ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3 := by sorry
  --  exact h₁
  hole