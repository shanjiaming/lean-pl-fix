theorem cos_pi_rational_values (p q : ℤ) (h : ∃ r, cos ((↑p : ℝ) * π / (↑q : ℝ)) = (↑r : ℝ)) : ∃ r ∈ {0, 1, -1, 1 / 2, -1 / 2}, cos ((↑p : ℝ) * π / (↑q : ℝ)) = (↑r : ℝ) :=
  by
  by_cases hq : q = 0
  ·
    have h₁ : cos (p * π / q) = (1 : ℝ) := by sorry
    have h₂ : ∃ r : ℚ, r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r := by sorry
    exact h₂
  ·
    have h₃ : ∃ (r : ℚ), r ∈ ({0, 1, -1, 1 / 2, -1 / 2} : Set ℚ) ∧ cos (p * π / q) = r := by sorry
    exact h₃