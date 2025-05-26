theorem h_main (p : ℕ) : ∃ m, (15 * m + 8) % 7 = 1 ∧ m = 7 * p :=
  by
  --  use 7 * p
  --  constructor
  ·
    have h₁ : (15 * (7 * p) + 8 : ℕ) % 7 = 1 := by sorry
  --    exact h₁
  --  · rfl
  hole