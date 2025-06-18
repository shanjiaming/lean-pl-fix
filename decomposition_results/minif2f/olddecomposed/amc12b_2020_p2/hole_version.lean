macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem amc12b_2020_p2 :
    (100 ^ 2 - 7 ^ 2 : ℝ) / (70 ^ 2 - 11 ^ 2) * ((70 - 11) * (70 + 11) / ((100 - 7) * (100 + 7))) =
      1 := by
  have h1 : (100 : ℝ) ^ 2 - 7 ^ 2 = (100 - 7) * (100 + 7) := by
    hole_2
  
  have h2 : (70 : ℝ) ^ 2 - 11 ^ 2 = (70 - 11) * (70 + 11) := by
    hole_3
  
  have h3 : (100 ^ 2 - 7 ^ 2 : ℝ) / (70 ^ 2 - 11 ^ 2) * ((70 - 11) * (70 + 11) / ((100 - 7) * (100 + 7))) = 1 := by
    rw [h1, h2]
    have h4 : (70 - 11 : ℝ) ≠ 0 := by hole_5
    have h5 : (70 + 11 : ℝ) ≠ 0 := by hole_6
    have h6 : (100 - 7 : ℝ) ≠ 0 := by hole_7
    have h7 : (100 + 7 : ℝ) ≠ 0 := by hole_8
    hole_4
  
  hole_1