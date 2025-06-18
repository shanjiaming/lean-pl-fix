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
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem algebra_absxm1pabsxpabsxp1eqxp2_0leqxleq1 (x : ℝ)
    (h₀ : abs (x - 1) + abs x + abs (x + 1) = x + 2) : 0 ≤ x ∧ x ≤ 1 := by
  have h₁ : 0 ≤ x := by
    by_contra h
    
    have h₂ : x < 0 := by hole_3
    
    by_cases h₃ : x < -1
    · 
      have h₄ : abs (x - 1) = -(x - 1) := by
        hole_4
      have h₅ : abs x = -x := by
        hole_5
      have h₆ : abs (x + 1) = -(x + 1) := by
        hole_6
      rw [h₄, h₅, h₆] at h₀
      
      have h₇ : - (x - 1) + -x + - (x + 1) = x + 2 := by hole_7
      have h₈ : x = -1 / 2 := by hole_8
      linarith
    · 
      have h₄ : x ≥ -1 := by hole_9
      clear h₄
      have h₄ : x ≥ -1 := skip_hole
      have h₅ : abs (x - 1) = -(x - 1) := by
        hole_10
      have h₆ : abs x = -x := by
        hole_11
      have h₇ : abs (x + 1) = x + 1 := by
        hole_12
      rw [h₅, h₆, h₇] at h₀
      
      have h₈ : - (x - 1) + -x + (x + 1) = x + 2 := by hole_13
      have h₉ : x = 0 := by hole_14
      hole_2
  clear h₁
  have h₁ : 0 ≤ x := skip_hole
  
  have h₂ : x ≤ 1 := by
    by_contra h
    
    have h₃ : x > 1 := by hole_16
    
    have h₄ : abs (x - 1) = x - 1 := by
      hole_17
    have h₅ : abs x = x := by
      hole_18
    have h₆ : abs (x + 1) = x + 1 := by
      hole_19
    
    rw [h₄, h₅, h₆] at h₀
    
    have h₇ : x = 1 := by hole_20
    hole_15
  clear h₂
  have h₂ : x ≤ 1 := skip_hole
  
  have h₃ : 0 ≤ x ∧ x ≤ 1 := by
    hole_21
  clear h₃
  have h₃ : 0 ≤ x ∧ x ≤ 1 := skip_hole
  
  hole_1