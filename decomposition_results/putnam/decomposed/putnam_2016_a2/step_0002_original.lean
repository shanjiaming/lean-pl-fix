theorem h_main (M : ℕ → ℕ) (hM : ∀ n > 0, IsGreatest {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} (M n)) : sorry :=
  by
  have h₁ : Tendsto (fun n : ℕ => (M n : ℝ) / n) atTop (𝓝 ((3 + Real.sqrt 5) / 2)) := by sorry
  exact h₁