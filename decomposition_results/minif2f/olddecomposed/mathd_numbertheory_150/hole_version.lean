macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_150 (n : ℕ) (h₀ : ¬Nat.Prime (7 + 30 * n)) : 6 ≤ n := by
  have h₁ : n ≥ 6 := by
    by_contra h
    
    have h₂ : n ≤ 5 := by hole_3
    
    hole_2
  
  hole_1