theorem h₁ (a b c d e f : ℤ) (ε : ℝ) (hne : a * d ≠ b * c) (hε : ε > 0) : ↑a * ↑d ≠ ↑b * ↑c := by -- norm_cast <;> exact hne
  omega