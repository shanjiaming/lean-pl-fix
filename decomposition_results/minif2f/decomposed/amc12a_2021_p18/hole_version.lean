macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem amc12a_2021_p18 (f : ℚ → ℝ) (h₀ : ∀ x > 0, ∀ y > 0, f (x * y) = f x + f y)
    (h₁ : ∀ p, Nat.Prime p → f p = p) : f (25 / 11) < 0 := by
  have h₂ : f 1 = 0 := by
    have h₂₁ : f (1 * 1 : ℚ) = f 1 + f 1 := by
      have h₂₂ : f (1 * 1 : ℚ) = f 1 + f 1 := h₀ 1 (by norm_num) 1 (by norm_num)
      hole_3
    have h₂₂ : f (1 * 1 : ℚ) = f 1 + f 1 := h₂₁
    have h₂₃ : f (1 * 1 : ℚ) = f 1 := by hole_4
    have h₂₄ : f 1 + f 1 = f 1 := by hole_5
    have h₂₅ : f 1 = 0 := by hole_6
    hole_2
  
  have h₃ : f (5 : ℚ) = (5 : ℝ) := by
    have h₃₁ : Nat.Prime 5 := by hole_8
    have h₃₂ : f (5 : ℚ) = (5 : ℝ) := by
      have h₃₃ : f (5 : ℚ) = 5 := h₁ 5 h₃₁
      hole_9
      <;> norm_num
      <;> linarith
    hole_7
  
  have h₄ : f (25 : ℚ) = (10 : ℝ) := by
    have h₄₁ : f (25 : ℚ) = f (5 * 5 : ℚ) := by hole_11
    rw [h₄₁]
    have h₄₂ : f (5 * 5 : ℚ) = f (5 : ℚ) + f (5 : ℚ) := h₀ 5 (by norm_num) 5 (by norm_num)
    hole_10
    <;> linarith
  
  have h₅ : f (11 : ℚ) = (11 : ℝ) := by
    have h₅₁ : Nat.Prime 11 := by hole_13
    have h₅₂ : f (11 : ℚ) = (11 : ℝ) := by
      have h₅₃ : f (11 : ℚ) = 11 := h₁ 11 h₅₁
      hole_14
      <;> norm_num
      <;> linarith
    hole_12
  
  have h₆ : f (25 / 11 : ℚ) = (-1 : ℝ) := by
    have h₆₁ : f ((25 / 11 : ℚ) * 11) = f (25 / 11 : ℚ) + f (11 : ℚ) := h₀ (25 / 11 : ℚ) (by norm_num) 11 (by norm_num)
    have h₆₂ : f ((25 / 11 : ℚ) * 11) = f (25 : ℚ) := by hole_16
    have h₆₃ : f (25 / 11 : ℚ) + f (11 : ℚ) = f (25 : ℚ) := by hole_17
    have h₆₄ : f (25 / 11 : ℚ) = f (25 : ℚ) - f (11 : ℚ) := by hole_18
    hole_15
    <;> linarith
  
  have h₇ : f (25 / 11 : ℚ) < 0 := by
    hole_19
    <;> linarith
  
  hole_1