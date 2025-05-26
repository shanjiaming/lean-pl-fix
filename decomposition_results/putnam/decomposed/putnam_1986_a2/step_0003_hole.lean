theorem h₁  : ⌊10 ^ 20000 / (10 ^ 100 + 3)⌋₊ % 10 = 3 :=
  by
  have h₂ : (3 : ℕ) ^ 200 < 10 ^ 100 + 3 := by sorry
  have h₃ : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) = (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) := by sorry
  --  rw [h₃]
  have h₄ : (10 ^ 20000 - 3 ^ 200) / (10 ^ 100 + 3) % 10 = 3 := by sorry
  exact h₄
  hole