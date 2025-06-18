macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_296 : abs ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = 3600 := by
  have h₁ : (3491 - 60 : ℕ) = 3431 := by
    hole_2
  
  have h₂ : (3491 + 60 : ℕ) = 3551 := by
    hole_3
  
  have h₃ : (3431 : ℕ) * 3551 = 12183481 := by
    hole_4
  
  have h₄ : (3491 : ℕ) ^ 2 = 12187081 := by
    hole_5
  
  have h₅ : ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = -3600 := by
    have h₅₁ : ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = -3600 := by
      hole_7
    hole_6
  
  have h₆ : abs ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = 3600 := by
    hole_8
  
  hole_1