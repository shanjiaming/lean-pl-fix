macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)

theorem mathd_algebra_346 (f g : ℝ → ℝ) (h₀ : ∀ x, f x = 2 * x - 3) (h₁ : ∀ x, g x = x + 1) :
    g (f 5 - 1) = 7 := by
  have h₂ : f 5 = 7 := by
    hole_1
  
  have h₃ : f 5 - 1 = 6 := by
    hole_2
  
  have h₄ : g (f 5 - 1) = 7 := by
    hole_3
  
  hole_4