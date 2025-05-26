theorem putnam_1986_a2  : ⌊10 ^ 20000 / (10 ^ 100 + 3)⌋₊ % 10 = 3 :=
  by
  have h_main : Nat.floor ((10 ^ 20000 : ℝ) / (10 ^ 100 + 3)) % 10 = 3 := by sorry
  --  exact h_main
  hole