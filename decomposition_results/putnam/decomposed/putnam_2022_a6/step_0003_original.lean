theorem h₁ (n : ℕ) (hn : 0 < n) (h : ¬False) : ∃ x,
    StrictMono x ∧
      -1 < x 1 ∧
        x (2 * n) < 1 ∧ ∀ k ∈ Icc 1 n, ∑ i ∈ Finset.Icc 1 n, (x (2 * i - 1) ^ (2 * k - 1) - x (2 * i) ^ (2 * k - 1)) = 1 :=
  by
  classical
  have h₂ :
    n ∈
      {m : ℕ |
        ∃ x : ℕ → ℝ,
          StrictMono x ∧
            -1 < x 1 ∧
              x (2 * n) < 1 ∧
                ∀ k ∈ Icc 1 m,
                  ∑ i in Finset.Icc 1 n, ((x (2 * i - 1) : ℝ) ^ (2 * k - 1) - (x (2 * i)) ^ (2 * k - 1)) = 1} :=
    by simpa using h
  simpa using h₂