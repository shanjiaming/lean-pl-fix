macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_185 (n : ℕ) (h₀ : n % 5 = 3) : 2 * n % 5 = 1 := by
  have h₁ : (2 * n) % 5 = (2 * (n % 5)) % 5 := by
    hole_2
  
  have h₂ : (2 * n) % 5 = (2 * 3) % 5 := by
    hole_3
  
  have h₃ : (2 * n) % 5 = 1 := by
    hole_4
  
  hole_1