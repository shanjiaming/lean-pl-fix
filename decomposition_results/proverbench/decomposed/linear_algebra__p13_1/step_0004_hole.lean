theorem h₂ (T : ℤ × ℤ →+ ℤ) (x y : ℤ) (h₁ : T (x, y) = T (x • (1, 0) + y • (0, 1))) : T (x • (1, 0) + y • (0, 1)) = T (x • (1, 0)) + T (y • (0, 1)) := by -- apply map_add
  hole