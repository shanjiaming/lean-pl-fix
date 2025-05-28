theorem h_final (h_main : ∀ (x y : ℝ), y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2 → y * (y - 1) ≤ x ^ 2) : (∀ (x y : ℝ), y ≥ 0 ∧ y * (y + 1) ≤ (x + 1) ^ 2 → y * (y - 1) ≤ x ^ 2) ↔ True :=
  by
  constructor
  · intro h
    trivial
  · intro h
    exact h_main