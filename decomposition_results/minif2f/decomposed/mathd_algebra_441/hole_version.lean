macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_441 (x : ℝ) (h₀ : x ≠ 0) :
    12 / (x * x) * (x ^ 4 / (14 * x)) * (35 / (3 * x)) = 10 := by
  have h₁ : 12 / (x * x) * (x ^ 4 / (14 * x)) * (35 / (3 * x)) = (12 * x ^ 4 * 35) / ((x * x) * (14 * x) * (3 * x)) := by
    have h₁₁ : 12 / (x * x) * (x ^ 4 / (14 * x)) * (35 / (3 * x)) = (12 / (x * x)) * ((x ^ 4 / (14 * x)) * (35 / (3 * x))) := by
      hole_3
    rw [h₁₁]
    have h₁₂ : (x ^ 4 / (14 * x)) * (35 / (3 * x)) = (x ^ 4 * 35) / ((14 * x) * (3 * x)) := by
      hole_4
    rw [h₁₂]
    have h₁₃ : (12 / (x * x)) * ((x ^ 4 * 35) / ((14 * x) * (3 * x))) = (12 * x ^ 4 * 35) / ((x * x) * (14 * x) * (3 * x)) := by
      hole_5
    hole_2
  
  have h₂ : (x * x) * (14 * x) * (3 * x) = 42 * x ^ 4 := by
    have h₂₁ : (x * x) * (14 * x) * (3 * x) = 42 * x ^ 4 := by
      hole_7
    hole_6
  
  have h₃ : 12 / (x * x) * (x ^ 4 / (14 * x)) * (35 / (3 * x)) = (12 * x ^ 4 * 35) / (42 * x ^ 4) := by
    hole_8
  
  have h₄ : (12 * x ^ 4 * 35) / (42 * x ^ 4) = 10 := by
    have h₄₁ : x ^ 4 ≠ 0 := by
      hole_10
    have h₄₂ : (12 * x ^ 4 * 35) / (42 * x ^ 4) = 10 := by
      have h₄₃ : (12 * x ^ 4 * 35) / (42 * x ^ 4) = (12 * 35 : ℝ) / 42 := by
        hole_12
      hole_11
    hole_9
  
  have h₅ : 12 / (x * x) * (x ^ 4 / (14 * x)) * (35 / (3 * x)) = 10 := by
    hole_13
  
  hole_1