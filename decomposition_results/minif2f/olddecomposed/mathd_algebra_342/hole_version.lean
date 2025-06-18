macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_342 (a d : ℝ) (h₀ : (∑ k in Finset.range 5, (a + k * d)) = 70)
    (h₁ : (∑ k in Finset.range 10, (a + k * d)) = 210) : a = 42 / 5 := by
  have h₂ : 5 * a + 10 * d = 70 := by
    have h₂₁ : (∑ k in Finset.range 5, (a + k * d : ℝ)) = 5 * a + 10 * d := by
      hole_3
    hole_2
  
  have h₃ : 10 * a + 45 * d = 210 := by
    have h₃₁ : (∑ k in Finset.range 10, (a + k * d : ℝ)) = 10 * a + 45 * d := by
      hole_5
    hole_4
  
  have h₄ : a + 2 * d = 14 := by
    have h₄₁ : 5 * a + 10 * d = 70 := h₂
    have h₄₂ : a + 2 * d = 14 := by
      have h₄₃ : 5 * a + 10 * d = 70 := h₂
      have h₄₄ : a + 2 * d = 14 := by
        hole_8
      hole_7
    hole_6
  
  have h₅ : 2 * a + 9 * d = 42 := by
    have h₅₁ : 2 * a + 9 * d = 42 := by
      hole_10
    hole_9
  
  have h₆ : d = 14 / 5 := by
    have h₆₁ : d = 14 / 5 := by
      have h₆₂ : 5 * d = 14 := by
        hole_13
      hole_12
    hole_11
  
  have h₇ : a = 42 / 5 := by
    have h₇₁ : a = 42 / 5 := by
      have h₇₂ : a + 2 * d = 14 := h₄
      have h₇₃ : d = 14 / 5 := h₆
      hole_15
    hole_14
  
  hole_1