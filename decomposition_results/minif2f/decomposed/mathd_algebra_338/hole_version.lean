macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_338 (a b c : ℝ) (h₀ : 3 * a + b + c = -3) (h₁ : a + 3 * b + c = 9)
    (h₂ : a + b + 3 * c = 19) : a * b * c = -56 := by
  have h₃ : a = -4 := by
    have h₃₁ : 5 * a + 17 = -3 := by
      have h₃₂ : b = a + 6 := by
        have h₃₃ : a - b = -6 := by
          have h₃₄ : -2 * (a - b) = 12 := by
            hole_6
          hole_5
        hole_4
      have h₃₄ : c = a + 11 := by
        have h₃₅ : a - c = -11 := by
          have h₃₆ : -2 * (a - c) = 22 := by
            hole_9
          hole_8
        hole_7
      hole_3
    hole_2
  
  have h₄ : b = 2 := by
    have h₄₁ : b = a + 6 := by
      have h₄₂ : a - b = -6 := by
        have h₄₃ : -2 * (a - b) = 12 := by
          hole_13
        hole_12
      hole_11
    hole_10
  
  have h₅ : c = 7 := by
    have h₅₁ : c = a + 11 := by
      have h₅₂ : a - c = -11 := by
        have h₅₃ : -2 * (a - c) = 22 := by
          hole_17
        hole_16
      hole_15
    hole_14
  
  have h₆ : a * b * c = -56 := by
    hole_18
  
  hole_1