macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem mathd_numbertheory_293 (n : ℕ) (h₀ : n ≤ 9) (h₁ : 11 ∣ 20 * 100 + 10 * n + 7) : n = 5 := by
  have h₂ : n = 5 := by
    
    have h₃ : n ≤ 9 := h₀
    have h₄ : 11 ∣ 20 * 100 + 10 * n + 7 := h₁
    
    hole_1
  hole_2