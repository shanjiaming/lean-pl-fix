macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem amc12_2000_p6 (p q : ℕ) (h₀ : Nat.Prime p ∧ Nat.Prime q) (h₁ : 4 ≤ p ∧ p ≤ 18)
    (h₂ : 4 ≤ q ∧ q ≤ 18) : ↑p * ↑q - (↑p + ↑q) ≠ (194 : ℕ) := by
  have h₃ : p = 5 ∨ p = 7 ∨ p = 11 ∨ p = 13 ∨ p = 17 := by
    have h₃₁ : p = 5 ∨ p = 7 ∨ p = 11 ∨ p = 13 ∨ p = 17 := by
      have h₄ := h₀.1
      have h₅ : p ≤ 18 := by hole_4
      have h₆ : 4 ≤ p := by hole_5
      hole_3
    hole_2
  
  have h₄ : q = 5 ∨ q = 7 ∨ q = 11 ∨ q = 13 ∨ q = 17 := by
    have h₄₁ : q = 5 ∨ q = 7 ∨ q = 11 ∨ q = 13 ∨ q = 17 := by
      have h₅ := h₀.2
      have h₆ : q ≤ 18 := by hole_8
      have h₇ : 4 ≤ q := by hole_9
      hole_7
    hole_6
  
  have h₅ : p * q ≥ p + q := by
    have h₅₁ : p ≥ 5 := by
      have h₅₂ := h₀.1.two_le
      have h₅₃ := h₁.1
      have h₅₄ : p ≥ 4 := by hole_12
      have h₅₅ : p ≠ 4 := by
        hole_13
      hole_11
    have h₅₂ : q ≥ 5 := by
      have h₅₃ := h₀.2.two_le
      have h₅₄ := h₂.1
      have h₅₅ : q ≥ 4 := by hole_15
      have h₅₆ : q ≠ 4 := by
        hole_16
      hole_14
    have h₅₃ : p * q ≥ p + q := by
      hole_17
    hole_10
  
  have h₆ : p * q - (p + q) ≠ 194 := by
    have h₆₁ : p = 5 ∨ p = 7 ∨ p = 11 ∨ p = 13 ∨ p = 17 := h₃
    have h₆₂ : q = 5 ∨ q = 7 ∨ q = 11 ∨ q = 13 ∨ q = 17 := h₄
    hole_18
  
  intro h₇
  have h₈ : p * q - (p + q) ≠ 194 := h₆
  have h₉ : ↑p * ↑q - (↑p + ↑q) = (194 : ℕ) := by hole_19
  have h₁₀ : p * q - (p + q) = 194 := by hole_20
  hole_1