macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_388 (x y z : ℝ) (h₀ : 3 * x + 4 * y - 12 * z = 10)
    (h₁ : -2 * x - 3 * y + 9 * z = -4) : x = 14 := by
  have h₂ : 9 * x + 12 * y - 36 * z = 30 := by
    have h₂₁ : 9 * x + 12 * y - 36 * z = 30 := by
      have h₂₂ : 3 * (3 * x + 4 * y - 12 * z) = 3 * 10 := by
        hole_4
      hole_3
    hole_2
  
  have h₃ : -8 * x - 12 * y + 36 * z = -16 := by
    have h₃₁ : 4 * (-2 * x - 3 * y + 9 * z) = 4 * (-4) := by
      hole_6
    hole_5
  
  have h₄ : x = 14 := by
    have h₄₁ : x = 14 := by
      have h₄₂ : 9 * x + 12 * y - 36 * z + (-8 * x - 12 * y + 36 * z) = 30 + (-16) := by
        hole_9
      hole_8
    hole_7
  
  hole_1