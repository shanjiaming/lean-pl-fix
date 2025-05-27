theorem T_value (T : ℤ × ℤ →+ ℤ) (x y : ℤ) : T (x, y) = 3 * x - 5 * y :=
  by
  have h : T (x, y) = 3 * x - 5 * y := by sorry
  --  exact h
  linarith