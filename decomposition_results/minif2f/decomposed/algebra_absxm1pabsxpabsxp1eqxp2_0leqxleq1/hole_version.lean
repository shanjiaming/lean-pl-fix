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
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)

theorem algebra_absxm1pabsxpabsxp1eqxp2_0leqxleq1 (x : ℝ)
    (h₀ : abs (x - 1) + abs x + abs (x + 1) = x + 2) : 0 ≤ x ∧ x ≤ 1 := by
  have h₁ : 0 ≤ x := by
    by_contra h
    
    have h₂ : x < 0 := by hole_1
    
    by_cases h₃ : x < -1
    · 
      have h₄ : abs (x - 1) = -(x - 1) := by
        hole_2
      have h₅ : abs x = -x := by
        hole_3
      have h₆ : abs (x + 1) = -(x + 1) := by
        hole_4
      rw [h₄, h₅, h₆] at h₀
      
      have h₇ : - (x - 1) + -x + - (x + 1) = x + 2 := by hole_5
      have h₈ : x = -1 / 2 := by hole_6
      linarith
    · 
      have h₄ : x ≥ -1 := by hole_7
      have h₅ : abs (x - 1) = -(x - 1) := by
        hole_8
      have h₆ : abs x = -x := by
        hole_9
      have h₇ : abs (x + 1) = x + 1 := by
        hole_10
      rw [h₅, h₆, h₇] at h₀
      
      have h₈ : - (x - 1) + -x + (x + 1) = x + 2 := by hole_11
      have h₉ : x = 0 := by hole_12
      hole_13
  
  have h₂ : x ≤ 1 := by
    by_contra h
    
    have h₃ : x > 1 := by hole_14
    
    have h₄ : abs (x - 1) = x - 1 := by
      hole_15
    have h₅ : abs x = x := by
      hole_16
    have h₆ : abs (x + 1) = x + 1 := by
      hole_17
    
    rw [h₄, h₅, h₆] at h₀
    
    have h₇ : x = 1 := by hole_18
    hole_19
  
  have h₃ : 0 ≤ x ∧ x ≤ 1 := by
    hole_20
  
  hole_21