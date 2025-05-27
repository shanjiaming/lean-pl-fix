theorem h₄ (α : ℝ) (n : ℕ) (hn : n > 0) (h₁ : ↑⌊α⌋.toNat = ↑⌊α⌋) (h₃ : ↑⌊α⌋ ≤ α) : α - 1 < ↑⌊α⌋ :=
  by
  have h₅ : (⌊α⌋ : ℝ) > α - 1 := by sorry
  linarith