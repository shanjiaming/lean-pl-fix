theorem h₄ (M : ℕ → ℕ) (hM : ∀ n > 0, IsGreatest {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} (M n)) (h₂ : ∀ n > 0, ↑(M n) = ↑(M n)) (h₃ : ∀ n > 0, M n ∈ {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)}) : ∀ n > 0, IsGreatest {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} (M n) :=
  by
  intro n hn
  exact hM n hn