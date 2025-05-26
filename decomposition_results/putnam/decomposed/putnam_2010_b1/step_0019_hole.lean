theorem h_final (h_main : ¬∃ a, ∀ m > 0, ∑' (i : ℕ), a i ^ m = (↑m : ℝ)) : (∃ a, ∀ m > 0, ∑' (i : ℕ), a i ^ m = (↑m : ℝ)) ↔ False :=
  by
  --  constructor
  --  · intro h
  --    exfalso
  --    exact h_main h
  --  · intro h
  --    exfalso
  --    exact h
  hole