theorem T_value (x y : ℤ) : T (x, y) = 3 * x - 5 * y := by
  have h : T (x, y) = 3 * x - 5 * y := by
    -- Use the axiom `T_expression` to get `T (x, y) = 3 * x - 5 * y`
    apply T_expression
    <;> assumption
  
  -- The result follows directly from `h`
  exact h