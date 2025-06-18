macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_99 (n : ℕ) (h₀ : 2 * n % 47 = 15) : n % 47 = 31 := by
  have h₁ : n % 47 = 31 := by
    have h₂ : (2 * (n % 47)) % 47 = 15 := by
      have h₃ : (2 * n) % 47 = 15 := h₀
      have h₄ : (2 * n) % 47 = (2 * (n % 47)) % 47 := by
        hole_4
      hole_3
    
    have h₅ : n % 47 < 47 := Nat.mod_lt n (by norm_num)
    hole_2
  
  hole_1