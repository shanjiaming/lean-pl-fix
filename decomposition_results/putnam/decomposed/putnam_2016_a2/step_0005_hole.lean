theorem h₃ (M : ℕ → ℕ) (hM : ∀ n > 0, IsGreatest {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} (M n)) (h₂ : ∀ n > 0, (↑(M n) : ℝ) = (↑(M n) : ℝ)) : ∀ n > 0, M n ∈ {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} :=
  by
  --  intro n hn
  have h₄ := hM n hn
  --  exact h₄.1
  hole