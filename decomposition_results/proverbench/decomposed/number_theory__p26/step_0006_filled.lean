theorem h₅ (α : ℝ) (n : ℕ) (hn : n > 0) (h₁ : ↑⌊α⌋.toNat = ↑⌊α⌋) (h₃ : ↑⌊α⌋ ≤ α) : ↑⌊α⌋ > α - 1 := by -- linarith [Int.sub_one_lt_floor α]
  hole