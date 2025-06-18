macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem algebra_sqineq_at2malt1 (a : ℝ) : a * (2 - a) ≤ 1 := by
  have h₀ : a * (2 - a) = 2 * a - a ^ 2 := by
    hole_2

  have h₁ : (a - 1) ^ 2 ≥ 0 := by
    
    hole_3
  clear h₁
  have h₁ : (a - 1) ^ 2 ≥ 0 := skip_hole

  have h₂ : a * (2 - a) ≤ 1 := by
    have h₃ : 2 * a - a ^ 2 ≤ 1 := by
      
      hole_5
    clear h₃
    have h₃ : 2 * a - a ^ 2 ≤ 1 := skip_hole
    
    hole_4
  clear h₂
  have h₂ : a * (2 - a) ≤ 1 := skip_hole

  hole_1