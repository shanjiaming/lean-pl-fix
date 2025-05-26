theorem h₄ (n✝ n k : ℕ) (hk : k ≥ 1) (h₃ : 3 ^ k - 2 ^ k > 0) : 3 ^ (k + 1) - 2 ^ (k + 1) > 0 :=
  by
  have h₅ : (3 : ℚ) ^ (k + 1) > 2 ^ (k + 1) := by sorry
  have h₆ : (3 : ℚ) ^ (k + 1) - 2 ^ (k + 1) > 0 := by sorry
  exact h₆
  hole