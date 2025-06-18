macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_139 (s : ℝ → ℝ → ℝ)
    (h₀ : ∀ (x) (_ : x ≠ 0), ∀ (y) (_ : y ≠ 0), s x y = (1 / y - 1 / x) / (x - y)) :
    s 3 11 = 1 / 33 := by
  have h₁ : s 3 11 = (1 / (11 : ℝ) - 1 / (3 : ℝ)) / ((3 : ℝ) - 11) := by
    have h₁₀ : (3 : ℝ) ≠ 0 := by hole_3
    have h₁₁ : (11 : ℝ) ≠ 0 := by hole_4
    have h₁₂ : s (3 : ℝ) (11 : ℝ) = (1 / (11 : ℝ) - 1 / (3 : ℝ)) / ((3 : ℝ) - 11) := by
      hole_5
    hole_2
  
  have h₂ : s 3 11 = 1 / 33 := by
    hole_6
  
  hole_1