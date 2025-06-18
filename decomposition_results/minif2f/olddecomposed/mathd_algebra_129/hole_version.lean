macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_129 (a : ℝ) (h₀ : a ≠ 0) (h₁ : 8⁻¹ / 4⁻¹ - a⁻¹ = 1) : a = -2 := by
  have h₂ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ = 1 / 2 := by
    hole_2
  
  have h₃ : (1 : ℝ) / 2 - a⁻¹ = 1 := by
    have h₃₁ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ - a⁻¹ = 1 := h₁
    hole_3
  
  have h₄ : -a⁻¹ = 1 / 2 := by
    have h₄₁ : (1 : ℝ) / 2 - a⁻¹ = 1 := h₃
    have h₄₂ : -a⁻¹ = 1 / 2 := by
      hole_5
    hole_4
  
  have h₅ : a⁻¹ = -(1 / 2) := by
    have h₅₁ : -a⁻¹ = 1 / 2 := h₄
    have h₅₂ : a⁻¹ = -(1 / 2) := by
      have h₅₃ : -a⁻¹ = 1 / 2 := h₄
      have h₅₄ : a⁻¹ = -(1 / 2) := by
        hole_8
      hole_7
    hole_6
  
  have h₆ : a = -2 := by
    have h₆₁ : a⁻¹ = -(1 / 2) := h₅
    have h₆₂ : a = -2 := by
      have h₆₃ : a ≠ 0 := h₀
      have h₆₄ : a⁻¹ = -(1 / 2) := h₅
      have h₆₅ : a = -2 := by
        
        have h₆₆ : a⁻¹ = -(1 / 2) := h₆₄
        have h₆₇ : a = -2 := by
          
          have h₆₈ : a ≠ 0 := h₆₃
          have h₆₉ : a * a⁻¹ = 1 := by
            hole_13
          rw [h₆₆] at h₆₉
          have h₇₀ : a * (-(1 / 2 : ℝ)) = 1 := by hole_14
          have h₇₁ : a = -2 := by
            
            hole_15
          hole_12
        hole_11
      hole_10
    hole_9
  
  hole_1