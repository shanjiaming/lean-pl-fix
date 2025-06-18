macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem mathd_numbertheory_34 (x : ℕ) (h₀ : x < 100) (h₁ : x * 9 % 100 = 1) : x = 89 := by
  have h₂ : x = 89 := by
    hole_1
  hole_2