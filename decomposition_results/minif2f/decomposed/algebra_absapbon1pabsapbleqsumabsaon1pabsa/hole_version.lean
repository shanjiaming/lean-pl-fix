macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem algebra_absapbon1pabsapbleqsumabsaon1pabsa (a b : ℝ) :
    abs (a + b) / (1 + abs (a + b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
  have h₁ : abs (a + b) ≤ abs a + abs b := by
    hole_2
  
  have h₂ : ∀ (x y : ℝ), 0 ≤ x → x ≤ y → x / (1 + x) ≤ y / (1 + y) := by
    intro x y hx hxy
    have h₃ : 0 ≤ x := hx
    have h₄ : x ≤ y := hxy
    have h₅ : 0 ≤ y := by hole_4
    have h₆ : 0 ≤ 1 + x := by hole_5
    have h₇ : 0 ≤ 1 + y := by hole_6
    have h₈ : 0 < 1 + x := by hole_7
    have h₉ : 0 < 1 + y := by hole_8
    
    have h₁₀ : x / (1 + x) ≤ y / (1 + y) := by
      hole_9
    hole_3
  
  have h₃ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)) := by
    have h₄ : 0 ≤ abs (a + b) := abs_nonneg (a + b)
    have h₅ : 0 ≤ abs a + abs b := by hole_11
    have h₆ : abs (a + b) ≤ abs a + abs b := h₁
    have h₇ : 0 ≤ 1 + abs (a + b) := by hole_12
    have h₈ : 0 ≤ 1 + (abs a + abs b) := by hole_13
    have h₉ : 0 < 1 + abs (a + b) := by hole_14
    have h₁₀ : 0 < 1 + (abs a + abs b) := by hole_15
    
    have h₁₁ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)) := by
      have h₁₂ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)) := by
        
        have h₁₃ : 0 ≤ abs (a + b) := by hole_18
        have h₁₄ : abs (a + b) ≤ abs a + abs b := h₁
        have h₁₅ : 0 ≤ abs a + abs b := by hole_19
        have h₁₆ : 0 < 1 + abs (a + b) := by hole_20
        have h₁₇ : 0 < 1 + (abs a + abs b) := by hole_21
        
        have h₁₈ : abs (a + b) / (1 + abs (a + b)) ≤ (abs a + abs b) / (1 + (abs a + abs b)) := by
          hole_22
        hole_17
      hole_16
    hole_10
  
  have h₄ : (abs a + abs b) / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
    have h₅ : 0 ≤ abs a := abs_nonneg a
    have h₆ : 0 ≤ abs b := abs_nonneg b
    have h₇ : 0 ≤ abs a + abs b := by hole_24
    have h₈ : 0 < 1 + abs a := by hole_25
    have h₉ : 0 < 1 + abs b := by hole_26
    have h₁₀ : 0 < 1 + (abs a + abs b) := by hole_27
    have h₁₁ : (abs a + abs b) / (1 + (abs a + abs b)) = abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) := by
      hole_28
    rw [h₁₁]
    have h₁₂ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) := by
      have h₁₃ : 0 ≤ abs a := abs_nonneg a
      have h₁₄ : 0 < 1 + abs a := by hole_30
      have h₁₅ : 0 < 1 + (abs a + abs b) := by hole_31
      have h₁₆ : 0 < 1 + abs a + abs b := by hole_32
      
      have h₁₇ : 1 + abs a ≤ 1 + (abs a + abs b) := by
        hole_33
      
      have h₁₈ : abs a / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) := by
        hole_34
      hole_29
    have h₁₃ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) := by
      have h₁₄ : 0 ≤ abs b := abs_nonneg b
      have h₁₅ : 0 < 1 + abs b := by hole_36
      have h₁₆ : 0 < 1 + (abs a + abs b) := by hole_37
      have h₁₇ : 0 < 1 + abs a + abs b := by hole_38
      
      have h₁₈ : 1 + abs b ≤ 1 + (abs a + abs b) := by
        hole_39
      
      have h₁₉ : abs b / (1 + (abs a + abs b)) ≤ abs b / (1 + abs b) := by
        hole_40
      hole_35
    have h₂₀ : abs a / (1 + (abs a + abs b)) + abs b / (1 + (abs a + abs b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
      hole_41
    hole_23
  
  have h₅ : abs (a + b) / (1 + abs (a + b)) ≤ abs a / (1 + abs a) + abs b / (1 + abs b) := by
    hole_42
  
  hole_1