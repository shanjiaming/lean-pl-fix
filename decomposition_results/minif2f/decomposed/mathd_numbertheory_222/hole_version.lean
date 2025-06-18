macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)

theorem mathd_numbertheory_222 (b : ℕ) (h₀ : Nat.lcm 120 b = 3720) (h₁ : Nat.gcd 120 b = 8) :
    b = 248 := by
  have h₂ : 120 * b = 29760 := by
    have h₂₁ : Nat.gcd 120 b * Nat.lcm 120 b = 120 * b := by
      hole_1
    hole_2
  
  have h₃ : b = 248 := by
    have h₄ : b = 248 := by
      have h₅ : 120 * b = 29760 := h₂
      have h₆ : b = 248 := by
        
        have h₇ : b ≤ 248 := by
          by_contra h
          
          have h₈ : b ≥ 249 := by
            hole_3
          have h₉ : 120 * b ≥ 120 * 249 := by
            hole_4
          have h₁₀ : 120 * 249 = 29880 := by hole_5
          have h₁₁ : 120 * b ≥ 29880 := by
            hole_6
          have h₁₂ : 120 * b > 29760 := by
            hole_7
          hole_8
        
        hole_9
      hole_10
    hole_11
  
  hole_12