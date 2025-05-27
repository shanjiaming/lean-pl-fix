theorem partial_derivative_example  : partial_t 2 π = 24 * π ^ 2 :=
  by
  have h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π := by sorry
  have h2 : deriv (fun τ => g 2 τ) π = 24 * π ^ 2 := by sorry
  have h3 : partial_t 2 π = 24 * π ^ 2 := by sorry
  --  apply h3
  hole