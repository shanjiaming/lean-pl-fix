theorem unique_rational_function_condition :
  (f 1 = 2) ∧ (∀ x y : ℚ, f (x * y) = f x * f y - f (x + y) + 1) ↔
  (∀ x : ℚ, f x = x + 1) :=