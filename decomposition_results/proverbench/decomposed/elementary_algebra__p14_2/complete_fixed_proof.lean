theorem simplify_fraction : (4 * p^4 * q^7 * r^8) / (2 * p^3) = 2 * p * q^7 * r^8 := by
  have h_denominator_ne_zero : (2 : ℝ) * p ^ 3 ≠ 0 := by
    have h : p ≠ 0 := Fact.out (p := p ≠ 0)
    have h₁ : p ^ 3 ≠ 0 := by
      admit
    have h₂ : (2 : ℝ) * p ^ 3 ≠ 0 := by
      admit
    admit
  
  have h_main : (4 : ℝ) * p ^ 4 * q ^ 7 * r ^ 8 = (2 * p ^ 3) * (2 * p * q ^ 7 * r ^ 8) := by
    have h₁ : (4 : ℝ) * p ^ 4 * q ^ 7 * r ^ 8 = (2 * p ^ 3) * (2 * p * q ^ 7 * r ^ 8) := by
      admit
    admit
  
  have h_final : (4 * p ^ 4 * q ^ 7 * r ^ 8) / (2 * p ^ 3) = 2 * p * q ^ 7 * r ^ 8 := by
    have h₁ : (4 * p ^ 4 * q ^ 7 * r ^ 8 : ℝ) = (2 * p ^ 3 : ℝ) * (2 * p * q ^ 7 * r ^ 8 : ℝ) := by
      admit
    admit
  
  admit