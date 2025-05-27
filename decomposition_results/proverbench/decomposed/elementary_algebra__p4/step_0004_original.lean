theorem h₅ (x y : ℚ) (h : 2 * x + 3 * y = 8 ∧ 5 * x + 9 * y = -2) (h₂ : 2 * x + 3 * y = 8) (h₃ : 5 * x + 9 * y = -2) : 6 * x + 9 * y = 24 := by
  calc
    6 * x + 9 * y = 3 * (2 * x + 3 * y) := by ring
    _ = 3 * 8 := by rw [h₂]
    _ = 24 := by ring