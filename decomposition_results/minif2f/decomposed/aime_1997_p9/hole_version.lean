macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_1997_p9 (a : ℝ) (h₀ : 0 < a)
    (h₁ : 1 / a - Int.floor (1 / a) = a ^ 2 - Int.floor (a ^ 2)) (h₂ : 2 < a ^ 2) (h₃ : a ^ 2 < 3) :
    a ^ 12 - 144 * (1 / a) = 233 := by
  have h₄ : Int.floor (a ^ 2 : ℝ) = 2 := by
    hole_2
  
  have h₅ : Int.floor (1 / a : ℝ) = 0 := by
    have h₅₁ : 0 < (1 / a : ℝ) := by hole_4
    have h₅₂ : (1 / a : ℝ) < 1 := by
      
      have h₅₂₁ : 0 < a := h₀
      have h₅₂₂ : 0 < a ^ 2 := by hole_6
      have h₅₂₃ : a ^ 2 < 3 := h₃
      have h₅₂₄ : 2 < a ^ 2 := h₂
      
      have h₅₂₅ : a > 1 := by
        by_contra h
        
        have h₅₂₆ : a ≤ 1 := by hole_8
        have h₅₂₇ : a ^ 2 ≤ 1 := by
          hole_9
        hole_7
      
      have h₅₂₈ : (1 / a : ℝ) < 1 := by
        hole_10
      hole_5
    
    have h₅₃ : Int.floor (1 / a : ℝ) = 0 := by
      hole_11
    hole_3
  
  have h₆ : 1 / a = a ^ 2 - 2 := by
    have h₆₁ : (1 / a : ℝ) - ⌊(1 / a : ℝ)⌋ = a ^ 2 - ⌊(a ^ 2 : ℝ)⌋ := by hole_13
    hole_12
  
  have h₇ : a ^ 3 - 2 * a - 1 = 0 := by
    have h₇₁ : a ≠ 0 := by hole_15
    have h₇₂ : 1 / a = a ^ 2 - 2 := h₆
    have h₇₃ : a ^ 3 - 2 * a - 1 = 0 := by
      have h₇₄ : a ^ 3 - 2 * a - 1 = 0 := by
        have h₇₅ : 1 / a = a ^ 2 - 2 := h₆
        have h₇₆ : a ≠ 0 := by hole_18
        hole_17
      hole_16
    hole_14
  
  have h₈ : a ^ 2 - a - 1 = 0 := by
    have h₈₁ : a ≠ 0 := by hole_20
    have h₈₂ : a ^ 3 - 2 * a - 1 = 0 := h₇
    have h₈₃ : a ^ 2 - a - 1 = 0 := by
      have h₈₄ : a ^ 3 - 2 * a - 1 = 0 := h₇
      have h₈₅ : (a + 1) * (a ^ 2 - a - 1) = 0 := by
        hole_22
      have h₈₆ : a + 1 > 0 := by hole_23
      have h₈₇ : a ^ 2 - a - 1 = 0 := by
        hole_24
      hole_21
    hole_19
  
  have h₉ : a ^ 12 - 144 * (1 / a) = 233 := by
    have h₉₁ : a ^ 2 = a + 1 := by
      have h₉₁₁ : a ^ 2 - a - 1 = 0 := h₈
      hole_26
    have h₉₂ : a ^ 3 = 2 * a + 1 := by
      have h₉₂₁ : a ^ 3 - 2 * a - 1 = 0 := h₇
      hole_27
    have h₉₃ : a ^ 4 = 3 * a + 2 := by
      hole_28
    have h₉₄ : a ^ 5 = 5 * a + 3 := by
      hole_29
    have h₉₅ : a ^ 6 = 8 * a + 5 := by
      hole_30
    have h₉₆ : a ^ 12 = 233 + 144 * (1 / a) := by
      hole_31
      hole_34
    hole_25
  
  hole_1