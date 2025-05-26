theorem h₁₀ (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (hd_not_div_five : d % 5 ≠ 0) (h₃ : d % 2 = 1) (h₄ : d % 5 ≠ 0) (h₅ : d % 20 = 11) (h₆ : d % 5 = 1) (h₇ : d % 5 = 0 ∨ d % 5 = 1 ∨ d % 5 = 2 ∨ d % 5 = 3 ∨ d % 5 = 4) (h₈ : ¬d % 5 = 0) : d % 5 ≠ 1 := by
  by_contra h₁₀
  have h₁₁ : (d : ℤ) % 5 = 1 := by sorry
  have h₁₂ : (d : ℤ) % 5 = 1 := by sorry
  have h₁₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
  have h₁₄ : (d : ℤ) % 5 = 1 := by sorry
  have h₁₅ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by sorry
  have h₁₆ : (d : ℤ) % 5 = 1 := by sorry
  have h₁₇ : (d : ℤ) % 5 = 1 := by sorry
  have h₁₈ : ¬((d : ℤ) % 5 = 1) := by sorry
  omega