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

theorem amc12b_2021_p4 (m a : ℕ) (h₀ : 0 < m ∧ 0 < a) (h₁ : ↑m / ↑a = (3 : ℝ) / 4) :
    (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ) := by
  have h₂ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := by
    have h₂₁ : (m : ℝ) / (a : ℝ) = (3 : ℝ) / 4 := h₁
    have h₂₂ : (a : ℝ) ≠ 0 := by
      have h₂₂₁ : 0 < a := h₀.2
      hole_1
    have h₂₃ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := by
      hole_2
    hole_3
  
  have h₃ : (4 : ℕ) * m = (3 : ℕ) * a := by
    have h₃₁ : (4 : ℕ) * m = (3 : ℕ) * a := by
      hole_4
    hole_5
  
  have h₄ : (84 : ℝ) * (m : ℝ) + (70 : ℝ) * (a : ℝ) = (76 : ℝ) * ((m : ℝ) + (a : ℝ)) := by
    have h₄₁ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := h₂
    have h₄₂ : (84 : ℝ) * (m : ℝ) + (70 : ℝ) * (a : ℝ) = (76 : ℝ) * ((m : ℝ) + (a : ℝ)) := by
      have h₄₃ : (a : ℝ) = (4 : ℝ) * (m : ℝ) / 3 := by
        have h₄₄ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := h₂
        hole_6
      hole_7
    hole_8
  
  have h₅ : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ) := by
    have h₅₁ : (m : ℝ) + (a : ℝ) ≠ 0 := by
      have h₅₂ : 0 < (m : ℝ) := by hole_9
      have h₅₃ : 0 < (a : ℝ) := by hole_10
      have h₅₄ : 0 < (m : ℝ) + (a : ℝ) := by hole_11
      hole_12
    have h₅₂ : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ) := by
      have h₅₃ : (84 : ℝ) * (m : ℝ) + (70 : ℝ) * (a : ℝ) = (76 : ℝ) * ((m : ℝ) + (a : ℝ)) := h₄
      have h₅₄ : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ) := by
        hole_13
      hole_14
    hole_15
  
  hole_16