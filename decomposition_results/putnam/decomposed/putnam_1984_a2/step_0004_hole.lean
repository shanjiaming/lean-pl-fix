theorem h₂ (n✝ n : ℕ) : ∀ k ≥ 1,
    6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =
      2 ^ k / (3 ^ k - 2 ^ k) - 2 ^ (k + 1) / (3 ^ (k + 1) - 2 ^ (k + 1)) :=
  by
  intro k hk
  have h₃ : (3 : ℚ) ^ k - 2 ^ k > 0 := by sorry
  have h₄ : (3 : ℚ) ^ (k + 1) - 2 ^ (k + 1) > 0 := by sorry
  have h₅ :
    (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =
      (2 : ℚ) ^ k / (3 ^ k - 2 ^ k) - (2 : ℚ) ^ (k + 1) / (3 ^ (k + 1) - 2 ^ (k + 1)) := by sorry
  exact h₅
  hole