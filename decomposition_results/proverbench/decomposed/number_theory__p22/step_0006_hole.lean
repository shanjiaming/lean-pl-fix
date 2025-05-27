theorem h₃ (p q : ℤ) (h : ∃ r, cos (↑p * π / ↑q) = ↑r) (hq : ¬q = 0) : ∃ r ∈ {0, 1, -1, 1 / 2, -1 / 2}, cos (↑p * π / ↑q) = ↑r :=
  by
  obtain ⟨r, hr⟩ := h
  refine' ⟨r, _⟩
  constructor
  ·
    have h₄ : (r : ℝ) = Real.cos (p * Real.pi / q) := by sorry
    have h₅ : r = 0 ∨ r = 1 ∨ r = -1 ∨ r = 1 / 2 ∨ r = -1 / 2 := by sorry
    have h₆ : r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) := by sorry
    exact h₆
  · exact hr
  hole