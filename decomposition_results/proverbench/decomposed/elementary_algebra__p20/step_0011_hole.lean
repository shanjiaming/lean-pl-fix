theorem h_main (f : ℚ → ℚ) (h_forward : (f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) → ∀ (x : ℚ), f x = x + 1) (h_backward : (∀ (x : ℚ), f x = x + 1) → f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) : (f 1 = 2 ∧ ∀ (x y : ℚ), f (x * y) = f x * f y - f (x + y) + 1) ↔ ∀ (x : ℚ), f x = x + 1 :=
  by
  --  constructor
  --  · intro h
  --    exact h_forward h
  --  · intro h
  --    exact h_backward h
  hole