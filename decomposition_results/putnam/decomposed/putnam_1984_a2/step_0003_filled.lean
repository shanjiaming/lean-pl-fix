theorem h₁ (n : ℕ) : ∀ (n : ℕ),
    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =
      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
  by
  --  intro n
  have h₂ :
    ∀ k : ℕ,
      (k ≥ 1 →
        (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =
          (2 : ℚ) ^ k / (3 ^ k - 2 ^ k) - (2 : ℚ) ^ (k + 1) / (3 ^ (k + 1) - 2 ^ (k + 1))) := by sorry
  have h₃ :
    (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
      2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) := by sorry
  --  exact h₃
  hole