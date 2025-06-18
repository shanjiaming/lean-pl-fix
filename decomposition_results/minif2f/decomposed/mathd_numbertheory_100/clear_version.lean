macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_100 (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.gcd n 40 = 10)
    (h₂ : Nat.lcm n 40 = 280) : n = 70 := by
  have h₃ : n * 40 = 2800 := by
    have h₃₁ : Nat.gcd n 40 * Nat.lcm n 40 = n * 40 := by
      hole_3
    hole_2
  
  have h₄ : n = 70 := by
    have h₄₁ : n * 40 = 2800 := h₃
    have h₄₂ : n = 70 := by
      
      have h₄₃ : n ≤ 70 := by
        by_contra h
        
        have h₄₄ : n ≥ 71 := by
          hole_7
        clear h₄₄
        have h₄₄ : n ≥ 71 := skip_hole
        have h₄₅ : n * 40 ≥ 71 * 40 := by
          hole_8
        clear h₄₅
        have h₄₅ : n * 40 ≥ 71 * 40 := skip_hole
        have h₄₆ : n * 40 > 2800 := by
          hole_9
        clear h₄₆
        have h₄₆ : n * 40 > 2800 := skip_hole
        hole_6
      clear h₄₃
      have h₄₃ : n ≤ 70 := skip_hole
      have h₄₄ : n ≥ 70 := by
        by_contra h
        
        have h₄₅ : n ≤ 69 := by
          hole_11
        have h₄₆ : n * 40 ≤ 69 * 40 := by
          hole_12
        have h₄₇ : n * 40 < 2800 := by
          hole_13
        clear h₄₇
        have h₄₇ : n * 40 < 2800 := skip_hole
        hole_10
      
      hole_5
    hole_4
  
  hole_1