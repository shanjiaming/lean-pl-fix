theorem h₂ (M : ℕ → ℕ) (hM : ∀ n > 0, IsGreatest {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} (M n)) : ∀ n > 0, ↑(M n) = ↑(M n) := by
  intro n hn
  norm_cast