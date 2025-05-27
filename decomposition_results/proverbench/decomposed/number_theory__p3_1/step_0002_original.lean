theorem h_main (m : ℕ) : ∃ n, congruence1 n ∧ congruence2 n ∧ n = 15 * m + 8 :=
  by
  use 15 * m + 8
  constructor
  ·
    have h₁ : (15 * m + 8 : ℕ) % 3 = 2 := by sorry
    exact h₁
  · constructor
    ·
      have h₂ : (15 * m + 8 : ℕ) % 5 = 3 := by sorry
      exact h₂
    · rfl