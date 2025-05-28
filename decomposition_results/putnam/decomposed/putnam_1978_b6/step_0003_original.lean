theorem h₂ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) (i : ℕ) (hi : i ∈ Finset.Icc 1 n) : ∀ j ∈ Finset.Icc 1 (m * i), a i j ≤ 1 := by
  intro j hj
  have h₃ : a i j ∈ Icc 0 1 := ha i j
  exact h₃.2