macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)

theorem algebra_sqineq_at2malt1 (a : ℝ) : a * (2 - a) ≤ 1 := by
  have h₀ : a * (2 - a) = 2 * a - a ^ 2 := by
    hole_1

  have h₁ : (a - 1) ^ 2 ≥ 0 := by
    
    hole_2

  have h₂ : a * (2 - a) ≤ 1 := by
    have h₃ : 2 * a - a ^ 2 ≤ 1 := by
      
      hole_3
    
    hole_4

  hole_5