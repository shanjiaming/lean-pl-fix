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
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)

theorem amc12b_2002_p19 (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : a * (b + c) = 152)
    (h₂ : b * (c + a) = 162) (h₃ : c * (a + b) = 170) : a * b * c = 720 := by
  have h₄ : a * b + a * c + b * c = 242 := by
    have h₄₁ : a * b + a * c + b * c = 242 := by
      have h₄₂ : a * b + a * c = 152 := by
        have h₄₃ : a * b + a * c = a * (b + c) := by hole_1
        hole_2
      have h₄₄ : b * c + b * a = 162 := by
        have h₄₅ : b * c + b * a = b * (c + a) := by hole_3
        hole_4
      have h₄₆ : c * a + c * b = 170 := by
        have h₄₇ : c * a + c * b = c * (a + b) := by hole_5
        hole_6
      have h₄₈ : 2 * (a * b + a * c + b * c) = 484 := by
        hole_7
      hole_8
    hole_9
  
  have h₅ : a * b = 72 := by
    have h₅₁ : a * b + a * c = 152 := by
      have h₅₂ : a * b + a * c = a * (b + c) := by hole_10
      hole_11
    have h₅₃ : a * c = 80 := by
      hole_12
    have h₅₄ : a * b = 72 := by
      hole_13
    hole_14
  
  have h₆ : a * c = 80 := by
    have h₆₁ : a * b + a * c = 152 := by
      have h₆₂ : a * b + a * c = a * (b + c) := by hole_15
      hole_16
    have h₆₃ : b * c + b * a = 162 := by
      have h₆₄ : b * c + b * a = b * (c + a) := by hole_17
      hole_18
    hole_19
  
  have h₇ : b * c = 90 := by
    have h₇₁ : a * b + a * c = 152 := by
      have h₇₂ : a * b + a * c = a * (b + c) := by hole_20
      hole_21
    have h₇₃ : b * c + b * a = 162 := by
      have h₇₄ : b * c + b * a = b * (c + a) := by hole_22
      hole_23
    have h₇₅ : c * a + c * b = 170 := by
      have h₇₆ : c * a + c * b = c * (a + b) := by hole_24
      hole_25
    hole_26
  
  have h₈ : a * b * c = 720 := by
    have h₈₁ : 0 < a * b := by
      hole_27
    have h₈₂ : 0 < a * c := by
      hole_28
    have h₈₃ : 0 < b * c := by
      hole_29
    have h₈₄ : 0 < a * b * c := by
      hole_30
    have h₈₅ : (a * b * c) ^ 2 = 518400 := by
      hole_31
    have h₈₆ : a * b * c = 720 := by
      have h₈₇ : a * b * c > 0 := by hole_32
      hole_33
    hole_34
  
  hole_35