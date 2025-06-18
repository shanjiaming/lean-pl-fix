macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_765 (x : ℤ) (h₀ : x < 0) (h₁ : 24 * x % 1199 = 15) : x ≤ -449 := by
  have h_main : x ≤ -449 := by
    by_contra h
    
    have h₂ : x ≥ -448 := by hole_3
    
    have h₃ : x % 1199 = 750 := by
      
      have h₄ : (24 * x) % 1199 = 15 := h₁
      have h₅ : (24 * x) % 1199 = (24 * x % 1199) := by hole_5
      rw [h₅] at h₄
      have h₆ : (24 : ℤ) * x % 1199 = 15 := h₄
      have h₇ : x % 1199 = 750 := by
        
        have h₈ : (x : ℤ) % 1199 = 750 := by
          
          have h₉ : (24 : ℤ) * x % 1199 = 15 := h₆
          have h₁₀ : (x : ℤ) % 1199 = 750 := by
            
            hole_8
          hole_7
        hole_6
      hole_4
    
    have h₄ : x ≥ 750 := by
      
      have h₅ : x % 1199 = 750 := h₃
      have h₆ : x ≥ -448 := h₂
      
      have h₇ : x ≥ 750 := by
        by_contra h₈
        
        have h₉ : x < 750 := by hole_11
          clear h₉
          have h₉ : x < 750 := skip_hole
        have h₁₀ : x ≤ -449 := by
          
          hole_12
        clear h₁₀
        have h₁₀ : x ≤ -449 := skip_hole
        hole_10
      clear h₇
      have h₇ : x ≥ 750 := skip_hole
      hole_9
    clear h₄
    have h₄ : x ≥ 750 := skip_hole
    
    hole_2
  clear h_main
  have h_main : x ≤ -449 := skip_hole
  hole_1