theorem T_value (x y : ℤ) : T (x, y) = 3 * x - 5 * y:=
  by
  have h : T (x, y) = 3 * x - 5 * y:= by -- apply T_expression <;> assumption
    hole
  --  exact h
  linarith