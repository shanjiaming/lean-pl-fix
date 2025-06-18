macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem algebra_amgm_sumasqdivbgeqsuma (a b c d : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d) :
    a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a ≥ a + b + c + d := by
  have h₁ : a ^ 2 / b + b ≥ 2 * a := by
    have h₁₁ : 0 < b := by hole_3
    have h₁₂ : 0 < a := by hole_4
    have h₁₃ : 0 < a ^ 2 / b := by hole_5
    have h₁₄ : a ^ 2 / b * b = a ^ 2 := by
      hole_6
    have h₁₅ : a ^ 2 / b + b ≥ 2 * a := by
      
      have h₁₅₁ : 0 < a ^ 2 / b := by hole_8
      have h₁₅₂ : 0 < b := by hole_9
      have h₁₅₃ : 0 < a ^ 2 / b * b := by hole_10
      
      hole_7
    hole_2
  
  have h₂ : b ^ 2 / c + c ≥ 2 * b := by
    have h₂₁ : 0 < c := by hole_12
    have h₂₂ : 0 < b := by hole_13
    have h₂₃ : 0 < b ^ 2 / c := by hole_14
    have h₂₄ : b ^ 2 / c * c = b ^ 2 := by
      hole_15
    have h₂₅ : b ^ 2 / c + c ≥ 2 * b := by
      
      have h₂₅₁ : 0 < b ^ 2 / c := by hole_17
      have h₂₅₂ : 0 < c := by hole_18
      have h₂₅₃ : 0 < b ^ 2 / c * c := by hole_19
      
      hole_16
    hole_11
  
  have h₃ : c ^ 2 / d + d ≥ 2 * c := by
    have h₃₁ : 0 < d := by hole_21
    have h₃₂ : 0 < c := by hole_22
    have h₃₃ : 0 < c ^ 2 / d := by hole_23
    have h₃₄ : c ^ 2 / d * d = c ^ 2 := by
      hole_24
    have h₃₅ : c ^ 2 / d + d ≥ 2 * c := by
      
      have h₃₅₁ : 0 < c ^ 2 / d := by hole_26
      have h₃₅₂ : 0 < d := by hole_27
      have h₃₅₃ : 0 < c ^ 2 / d * d := by hole_28
      
      hole_25
    hole_20
  
  have h₄ : d ^ 2 / a + a ≥ 2 * d := by
    have h₄₁ : 0 < a := by hole_30
    have h₄₂ : 0 < d := by hole_31
    have h₄₃ : 0 < d ^ 2 / a := by hole_32
    have h₄₄ : d ^ 2 / a * a = d ^ 2 := by
      hole_33
    have h₄₅ : d ^ 2 / a + a ≥ 2 * d := by
      
      have h₄₅₁ : 0 < d ^ 2 / a := by hole_35
      have h₄₅₂ : 0 < a := by hole_36
      have h₄₅₃ : 0 < d ^ 2 / a * a := by hole_37
      
      hole_34
    hole_29
  
  have h₅ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a + (a + b + c + d) ≥ 2 * a + 2 * b + 2 * c + 2 * d := by
    have h₅₁ : a ^ 2 / b + b ≥ 2 * a := h₁
    have h₅₂ : b ^ 2 / c + c ≥ 2 * b := h₂
    have h₅₃ : c ^ 2 / d + d ≥ 2 * c := h₃
    have h₅₄ : d ^ 2 / a + a ≥ 2 * d := h₄
    have h₅₅ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a + (a + b + c + d) = (a ^ 2 / b + b) + (b ^ 2 / c + c) + (c ^ 2 / d + d) + (d ^ 2 / a + a) := by
      hole_39
    hole_38
  
  have h₆ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a ≥ a + b + c + d := by
    have h₆₁ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a + (a + b + c + d) ≥ 2 * a + 2 * b + 2 * c + 2 * d := h₅
    have h₆₂ : a ^ 2 / b + b ^ 2 / c + c ^ 2 / d + d ^ 2 / a ≥ a + b + c + d := by
      hole_41
    hole_40
  
  hole_1