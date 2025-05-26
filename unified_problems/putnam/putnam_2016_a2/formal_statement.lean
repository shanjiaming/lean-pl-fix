theorem putnam_2016_a2
    (M : ℕ → ℕ)
    (hM : ∀ n > 0, IsGreatest {m | 0 < m ∧ (m - 1).choose n < m.choose (n - 1)} (M n)) :
    Tendsto (fun n ↦ M n / (n : ℝ)) atTop (𝓝 (((3 + √ 5) / 2) : ℝ )) :=
  by