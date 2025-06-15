macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem constant_entire_function (f : ℂ → ℂ) (hf : Entire f) (h : ∀ z, 1 ≤ abs (f z)) :
  ∃ c : ℂ, ∀ z, f z = c := by
  have h₁ : ∃ (c : ℂ), ∀ (z : ℂ), f z = 1 / c := by
    
    hole_2
  
  have h₂ : ∃ (c : ℂ), ∀ (z : ℂ), f z = c := by
    
    hole_3
  
  
  hole_1