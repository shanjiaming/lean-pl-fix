theorem h₄ (α : ℝ) (n : ℕ) (hn : n > 0) (h₁ : (↑⌊α⌋.toNat : ℝ) = (↑⌊α⌋ : ℝ)) (h₃ : (↑⌊α⌋ : ℝ) ≤ α) : α - 1 < (↑⌊α⌋ : ℝ) :=
  by
  have h₅ : (⌊α⌋ : ℝ) > α - 1 := by sorry
  linarith