theorem h₂ (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) (n : ℤ) (h₁ : ‖z ^ (2 * n) - 1‖ = ‖z ^ n - star z ^ n‖) : ∃ q, ‖z ^ n - star z ^ n‖ = (↑q : ℝ) :=
  by
  have h₃ : ∃ (q1 q2 : ℚ), z.re = q1 ∧ z.im = q2 := hzrat
  --  obtain ⟨q1, q2, hq1, hq2⟩ := h₃
  have h₄ : z.re = q1 := hq1
  have h₅ : z.im = q2 := hq2
  have h₆ : ‖z‖ = 1 := hznorm
  have h₇ : (z.re : ℝ) = q1 := by sorry
  have h₈ : (z.im : ℝ) = q2 := by sorry
  have h₉ : ‖z‖ ^ 2 = 1 := by sorry
  have h₁₀ : (z.re : ℝ) ^ 2 + (z.im : ℝ) ^ 2 = 1 := by sorry
  have h₁₁ : (z.re : ℝ) ^ 2 + (z.im : ℝ) ^ 2 = 1 := h₁₀
  have h₁₂ : ‖z ^ n - (star z) ^ n‖ = 2 * |(z.im * n : ℝ)| := by sorry
  have h₁₃ : ∃ (q : ℚ), ‖z ^ n - (star z) ^ n‖ = q := by sorry
  --  exact h₁₃
  hole