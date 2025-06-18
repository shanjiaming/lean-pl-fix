macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem algebra_sqineq_unitcircatbpabsamblt1 (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) :
    a * b + abs (a - b) ≤ 1 := by
  have h₁ : a ≤ 1 := by
    hole_2
  clear h₁
  have h₁ : a ≤ 1 := skip_hole
  
  have h₂ : a ≥ -1 := by
    hole_3
  clear h₂
  have h₂ : a ≥ -1 := skip_hole
  
  have h₃ : b ≤ 1 := by
    hole_4
  clear h₃
  have h₃ : b ≤ 1 := skip_hole
  
  have h₄ : b ≥ -1 := by
    hole_5
  clear h₄
  have h₄ : b ≥ -1 := skip_hole
  
  have h₅ : a ≥ b → a * b + abs (a - b) ≤ 1 := by
    intro h₅
    have h₅₁ : abs (a - b) = a - b := by
      hole_7
    rw [h₅₁]
    have h₅₂ : a * b + (a - b) ≤ 1 := by
      have h₅₃ : (a - 1) * (b + 1) ≤ 0 := by
        hole_9
      clear h₅₃
      have h₅₃ : (a - 1) * (b + 1) ≤ 0 := skip_hole
      hole_8
    clear h₅₂
    have h₅₂ : a * b + (a - b) ≤ 1 := skip_hole
    hole_6
      clear h₅
      have h₅ : a ≥ b → a * b + abs (a - b) ≤ 1 := skip_hole
  
  have h₆ : a < b → a * b + abs (a - b) ≤ 1 := by
    intro h₆
    have h₆₁ : abs (a - b) = b - a := by
      hole_11
    rw [h₆₁]
    have h₆₂ : a * b + (b - a) ≤ 1 := by
      have h₆₃ : (a + 1) * (b - 1) ≤ 0 := by
        hole_13
      clear h₆₃
      have h₆₃ : (a + 1) * (b - 1) ≤ 0 := skip_hole
      hole_12
    clear h₆₂
    have h₆₂ : a * b + (b - a) ≤ 1 := skip_hole
    hole_10
      clear h₆
      have h₆ : a < b → a * b + abs (a - b) ≤ 1 := skip_hole
  
  have h₇ : a * b + abs (a - b) ≤ 1 := by
    by_cases h₇ : a ≥ b
    · 
      exact h₅ h₇
    · 
      have h₇₁ : a < b := by
        by_contra h₇₁
        
        have h₇₂ : a ≥ b := by hole_16
        hole_15
      clear h₇₁
      have h₇₁ : a < b := skip_hole
      hole_14
        clear h₇
        have h₇ : a * b + abs (a - b) ≤ 1 := skip_hole
  
  hole_1