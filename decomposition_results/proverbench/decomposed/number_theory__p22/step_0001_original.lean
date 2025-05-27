theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r, cos (↑p * π / ↑q) = ↑r) : ∃ r ∈ {0, 1, -1, 1 / 2, -1 / 2}, cos (↑p * π / ↑q) = ↑r :=
  by
  by_cases hq : q = 0
  ·
    have h₁ : cos (p * π / q) = (1 : ℝ) := by sorry
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r := by sorry
    exact h₂
  ·
    have h₃ : ∃ (r : ℚ), r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r := by sorry
    exact h₃