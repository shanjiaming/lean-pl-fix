theorem h₅ (α : ℝ) (n : ℕ) (hn : n > 0) (h₁ : (↑⌊α⌋.toNat : ℝ) = (↑⌊α⌋ : ℝ)) (h₃ : (↑⌊α⌋ : ℝ) ≤ α) (h₄ : α - 1 < (↑⌊α⌋ : ℝ)) : |α - (↑⌊α⌋ : ℝ)| < 1 := by
  rw [abs_lt]
  constructor <;> linarith