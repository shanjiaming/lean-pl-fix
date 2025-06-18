macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_247 (n : ℕ) (h₀ : 3 * n % 11 = 2) : n % 11 = 8 := by
  have h₁ : n % 11 = 8 := by
    have h₂ : 3 * (n % 11) % 11 = 2 := by
      have h₃ : 3 * n % 11 = 2 := h₀
      have h₄ : 3 * (n % 11) % 11 = 3 * n % 11 := by
        have h₅ : 3 * (n % 11) % 11 = (3 * n) % 11 := by
          have h₆ : 3 * (n % 11) = (3 * n) % 33 := by
            hole_6
          have h₇ : (3 * n) % 33 % 11 = (3 * n) % 11 := by
            hole_7
          hole_5
        hole_4
      hole_3
    
    have h₈ : n % 11 = 0 ∨ n % 11 = 1 ∨ n % 11 = 2 ∨ n % 11 = 3 ∨ n % 11 = 4 ∨ n % 11 = 5 ∨ n % 11 = 6 ∨ n % 11 = 7 ∨ n % 11 = 8 ∨ n % 11 = 9 ∨ n % 11 = 10 := by
      hole_8
    hole_2
  hole_1