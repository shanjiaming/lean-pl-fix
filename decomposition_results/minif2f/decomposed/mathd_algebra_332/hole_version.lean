macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)

theorem mathd_algebra_332 (x y : ℝ) (h₀ : (x + y) / 2 = 7) (h₁ : Real.sqrt (x * y) = Real.sqrt 19) :
    x ^ 2 + y ^ 2 = 158 := by
  have h₂ : x + y = 14 := by
    have h₂₁ : (x + y) / 2 = 7 := h₀
    have h₂₂ : x + y = 14 := by
      hole_1
    hole_2
  
  have h₃ : x * y = 19 := by
    have h₃₁ : Real.sqrt (x * y) = Real.sqrt 19 := h₁
    have h₃₂ : x * y ≥ 0 := by
      by_contra h
      
      have h₃₃ : x * y < 0 := by hole_3
      have h₃₄ : Real.sqrt (x * y) = 0 := by
        hole_4
      rw [h₃₄] at h₃₁
      have h₃₅ : Real.sqrt 19 > 0 := Real.sqrt_pos.mpr (by norm_num)
      have h₃₆ : (0 : ℝ) < Real.sqrt 19 := by hole_5
      hole_6
    have h₃₃ : x * y = 19 := by
      have h₃₄ : Real.sqrt (x * y) = Real.sqrt 19 := h₁
      have h₃₅ : Real.sqrt (x * y) = Real.sqrt 19 := h₁
      have h₃₆ : Real.sqrt (x * y) ^ 2 = Real.sqrt 19 ^ 2 := by hole_7
      have h₃₇ : x * y = 19 := by
        hole_8
      hole_9
    hole_10
  
  have h₄ : x ^ 2 + y ^ 2 = 158 := by
    have h₄₁ : x ^ 2 + y ^ 2 = (x + y) ^ 2 - 2 * (x * y) := by hole_11
    hole_12
  
  hole_13