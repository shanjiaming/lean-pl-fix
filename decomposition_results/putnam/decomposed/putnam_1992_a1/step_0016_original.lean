theorem h_main (f : ℤ → ℤ) (h_imp : (f = fun n => 1 - n) → (∀ (n : ℤ), f (f n) = n) ∧ (∀ (n : ℤ), f (f (n + 2) + 2) = n) ∧ f 0 = 1) (h_converse : (∀ (n : ℤ), f (f n) = n) ∧ (∀ (n : ℤ), f (f (n + 2) + 2) = n) ∧ f 0 = 1 → f = fun n => 1 - n) : (f = fun n => 1 - n) ↔ (∀ (n : ℤ), f (f n) = n) ∧ (∀ (n : ℤ), f (f (n + 2) + 2) = n) ∧ f 0 = 1 :=
  by
  constructor
  · intro h
    exact h_imp h
  · intro h
    exact h_converse h