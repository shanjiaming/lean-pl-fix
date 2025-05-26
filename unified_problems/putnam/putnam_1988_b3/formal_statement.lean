theorem putnam_1988_b3
    (r : ℤ → ℝ)
    (hr : ∀ n ≥ 1,
      (∃ c d : ℤ,
        (c ≥ 0 ∧ d ≥ 0) ∧
        c + d = n ∧ r n = |c - d * Real.sqrt 3|) ∧
        (∀ c d : ℤ, (c ≥ 0 ∧ d ≥ 0 ∧ c + d = n) → |c - d * Real.sqrt 3| ≥ r n))
    : IsLeast {g : ℝ | g > 0 ∧ (∀ n : ℤ, n ≥ 1 → r n ≤ g)} (((1 + Real.sqrt 3) / 2) : ℝ ) :=
  by