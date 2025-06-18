macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem amc12a_2021_p3 (x y : ℕ) (h₀ : x + y = 17402) (h₁ : 10 ∣ x) (h₂ : x / 10 = y) :
    ↑x - ↑y = (14238 : ℤ) := by
  have h₃ : x = 10 * y := by
    have h₃₁ : x = 10 * (x / 10) := by
      have h₃₁₁ : 10 ∣ x := h₁
      have h₃₁₂ : x = 10 * (x / 10) := by
        have h₃₁₃ : x = 10 * (x / 10) := by
          have h₃₁₄ : x / 10 * 10 = x := by
            hole_6
          hole_5
        hole_4
      hole_3
    hole_2
  
  have h₄ : y = 1582 := by
    have h₄₁ : 11 * y = 17402 := by
      have h₄₂ : x = 10 * y := h₃
      hole_8
    have h₄₂ : y = 1582 := by
      hole_9
    hole_7
  
  have h₅ : x = 15820 := by
    hole_10
  
  have h₆ : (x : ℤ) - (y : ℤ) = (14238 : ℤ) := by
    hole_11
  
  hole_1