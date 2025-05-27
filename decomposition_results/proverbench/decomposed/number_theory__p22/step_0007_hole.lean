theorem h₄ (p q : ℤ) (hq : ¬q = 0) (r : ℚ) (hr : cos (↑p * π / ↑q) = ↑r) : ↑r = cos (↑p * π / ↑q) := by -- rw [hr] <;> norm_cast
  hole