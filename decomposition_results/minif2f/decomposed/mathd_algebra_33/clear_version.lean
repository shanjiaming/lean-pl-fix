macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_33 (x y z : ℝ) (h₀ : x ≠ 0) (h₁ : 2 * x = 5 * y) (h₂ : 7 * y = 10 * z) :
    z / x = 7 / 25 := by
  have h₃ : 14 * x = 35 * y := by
    have h₃₁ : 14 * x = 35 * y := by
      have h₃₂ : 2 * x = 5 * y := h₁
      have h₃₃ : 7 * (2 * x) = 7 * (5 * y) := by hole_4
      have h₃₄ : 7 * (2 * x) = 14 * x := by hole_5
      have h₃₅ : 7 * (5 * y) = 35 * y := by hole_6
      hole_3
    hole_2
  
  have h₄ : 35 * y = 50 * z := by
    have h₄₁ : 7 * y = 10 * z := h₂
    have h₄₂ : 5 * (7 * y) = 5 * (10 * z) := by hole_8
    have h₄₃ : 5 * (7 * y) = 35 * y := by hole_9
    have h₄₄ : 5 * (10 * z) = 50 * z := by hole_10
    hole_7
  
  have h₅ : 14 * x = 50 * z := by
    hole_11
  
  have h₆ : z = (7 : ℝ) / 25 * x := by
    have h₆₁ : 14 * x = 50 * z := h₅
    have h₆₂ : z = (7 : ℝ) / 25 * x := by
      have h₆₃ : 50 * z = 14 * x := by hole_14
      have h₆₄ : z = (14 : ℝ) / 50 * x := by
        
        hole_15
      
      have h₆₅ : z = (7 : ℝ) / 25 * x := by
        hole_16
      hole_13
    hole_12
  
  have h₇ : z / x = 7 / 25 := by
    rw [h₆]
    have h₇₁ : (7 : ℝ) / 25 * x / x = 7 / 25 := by
      have h₇₂ : x ≠ 0 := h₀
      hole_18
    hole_17
  
  hole_1