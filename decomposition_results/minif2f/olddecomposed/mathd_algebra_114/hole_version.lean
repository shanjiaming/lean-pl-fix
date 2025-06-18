macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_114 (a : ℝ) (h₀ : a = 8) :
    (16 * (a ^ 2) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = 4 := by
  have h₁ : a > 0 := by
    hole_2
  
  have h₂ : (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) = a ^ (2 / 3 : ℝ) := by
    have h₂₁ : (a ^ 2 : ℝ) > 0 := by hole_4
    have h₂₂ : (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) = (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3) := rfl
    hole_3
    have h₄₂ : a > 0 := h₁
    have h₄₃ : a ^ (2 / 3 : ℝ) = 4 := by
      rw [h₄₁]
      
      
      have h₄₄ : (8 : ℝ) ^ (2 / 3 : ℝ) = 4 := by
        
        have h₄₅ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = Real.log 4 := by
          
          have h₄₆ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = (2 / 3 : ℝ) * Real.log 8 := by
            hole_17
          rw [h₄₆]
          have h₄₇ : Real.log 8 = Real.log (2 ^ 3) := by hole_18
          rw [h₄₇]
          have h₄₈ : Real.log (2 ^ 3 : ℝ) = 3 * Real.log 2 := by
            hole_19
          rw [h₄₈]
          have h₄₉ : Real.log 4 = Real.log (2 ^ 2) := by hole_20
          rw [h₄₉]
          have h₅₀ : Real.log (2 ^ 2 : ℝ) = 2 * Real.log 2 := by
            hole_21
          hole_16
        
        have h₅₁ : (8 : ℝ) ^ (2 / 3 : ℝ) > 0 := by hole_22
        have h₅₂ : (4 : ℝ) > 0 := by hole_23
        have h₅₃ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = Real.log 4 := h₄₅
        have h₅₄ : Real.log ((8 : ℝ) ^ (2 / 3 : ℝ)) = Real.log 4 := by hole_24
        have h₅₅ : (8 : ℝ) ^ (2 / 3 : ℝ) = 4 := by
          hole_25
        hole_15
      hole_14
    hole_13
  
  have h₅ : (16 * (a ^ 2 : ℝ) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = (16 * (4 : ℝ)) ^ ((1 : ℝ) / 3) := by
    hole_26
  
  have h₆ : (16 * (4 : ℝ)) ^ ((1 : ℝ) / 3) = (64 : ℝ) ^ ((1 : ℝ) / 3) := by
    hole_27
  
  have h₇ : (64 : ℝ) ^ ((1 : ℝ) / 3) = 4 := by
    have h₇₁ : (64 : ℝ) ^ ((1 : ℝ) / 3) = 4 := by
      
      have h₇₂ : Real.log ((64 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log 4 := by
        have h₇₃ : Real.log ((64 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log 64 := by
          hole_31
        rw [h₇₃]
        have h₇₄ : Real.log 64 = Real.log (2 ^ 6) := by hole_32
        rw [h₇₄]
        have h₇₅ : Real.log (2 ^ 6) = 6 * Real.log 2 := by
          hole_33
        rw [h₇₅]
        have h₇₆ : Real.log 4 = Real.log (2 ^ 2) := by hole_34
        rw [h₇₆]
        have h₇₇ : Real.log (2 ^ 2) = 2 * Real.log 2 := by
          hole_35
        hole_30
      have h₇₈ : (64 : ℝ) ^ ((1 : ℝ) / 3) > 0 := by hole_36
      have h₇₉ : (4 : ℝ) > 0 := by hole_37
      have h₈₀ : Real.log ((64 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log 4 := by hole_38
      have h₈₁ : (64 : ℝ) ^ ((1 : ℝ) / 3) = 4 := by
        hole_39
      hole_29
    hole_28
  
  have h₈ : (16 * (a ^ 2) ^ ((1 : ℝ) / 3)) ^ ((1 : ℝ) / 3) = 4 := by
    hole_40
  
  hole_1