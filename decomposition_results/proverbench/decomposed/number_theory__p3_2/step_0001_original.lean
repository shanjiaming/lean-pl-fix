theorem solve_congruence3 (p : ℕ) : ∃ m, (15 * m + 8) % 7 = 1 ∧ m = 7 * p :=
  by
  have h_main : ∃ (m : ℕ), (15 * m + 8) % 7 = 1 ∧ m = 7 * p := by sorry
  exact h_main