theorem general_solution (k : ℤ) : ∃ m n, m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 :=
  by
  have h_main : ∃ (m n : Int), m = -110 + 12 * k ∧ n = 66 - 7 * k ∧ 7 * m + 12 * n = 22 := by sorry
  exact h_main