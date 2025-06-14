macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem specificElementSumDifference :
 matrixM 0 0 + matrixM 1 1 + matrixM 2 2 - matrixM 3 0 - matrixM 3 1 - matrixM 3 2 = 119 := by
  have h₀ : matrixM 0 0 = (37 : ℝ) := by
    hole_2
  
  have h₁ : matrixM 1 1 = (1 : ℝ) := by
    hole_3
  
  have h₂ : matrixM 2 2 = (-24 : ℝ) := by
    hole_4
  
  have h₃ : matrixM 3 0 = (-62 : ℝ) := by
    hole_5
  
  have h₄ : matrixM 3 1 = (-3 : ℝ) := by
    hole_6
  
  have h₅ : matrixM 3 2 = (-40 : ℝ) := by
    hole_7
  
  have h₆ : matrixM 0 0 + matrixM 1 1 + matrixM 2 2 - matrixM 3 0 - matrixM 3 1 - matrixM 3 2 = 119 := by
    hole_8
  
  hole_1