theorem h_main (d : ℤ) (x y : ℚ) (h : x ≠ 1) : x ^ 2 - ↑d * y ^ 2 = 1 → ∃ t, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) :=
  by
  intro h₁
  have h₂ : x ≠ 1 := h
  have h₃ :
    y = 0 → x ^ 2 - ↑d * y ^ 2 = 1 → ∃ t : ℚ, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) := by sorry
  by_cases h₄ : y = 0
  · exact h₃ h₄ h₁
  ·
    have h₅ : x - 1 ≠ 0 := by sorry
    use y / (x - 1)
    have h₆ : x = (↑d * (y / (x - 1)) ^ 2 + 1) / (↑d * (y / (x - 1)) ^ 2 - 1) := by sorry
    have h₇ : y = 2 * (y / (x - 1)) / (↑d * (y / (x - 1)) ^ 2 - 1) := by sorry
    exact ⟨h₆, h₇⟩