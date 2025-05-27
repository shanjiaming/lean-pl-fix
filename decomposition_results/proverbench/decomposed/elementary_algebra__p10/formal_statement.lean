theorem injective_function_properties
  (h_inj : ∀ x y, f x = f y → x = y)
  (h_def : f 1 = 2 ∧ ∀ n ≥ 2, f n = n + 2) :
  (∀ m n, f (f m + f n) = f (f m) + f n) ∧ (f 1 = 2 ∧ f 2 = 4) :=