macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem amc12b_2020_p6 (n : ℕ) (h₀ : 9 ≤ n) : ∃ x : ℕ, (x : ℝ) ^ 2 = ((n + 2)! - (n + 1)!) / n ! := by
  have h₁ : ((n + 1 : ℕ) : ℝ) ^ 2 = ((n + 2)! - (n + 1)!) / n ! := by
    have h₂ : (n + 2 : ℕ) ! = (n + 2 : ℕ) * (n + 1 : ℕ) * n ! := by
      have h₃ : (n + 2 : ℕ) ! = (n + 2 : ℕ) * (n + 1 : ℕ) * n ! := by
        hole_4
      hole_3
    have h₃ : (n + 1 : ℕ) ! = (n + 1 : ℕ) * n ! := by
      have h₄ : (n + 1 : ℕ) ! = (n + 1 : ℕ) * n ! := by
        hole_6
      hole_5
    have h₄ : ((n + 2 : ℕ) ! : ℝ) = ((n + 2 : ℕ) * (n + 1 : ℕ) * n ! : ℝ) := by
      hole_7
    have h₅ : ((n + 1 : ℕ) ! : ℝ) = ((n + 1 : ℕ) * n ! : ℝ) := by
      hole_8
    have h₆ : (((n + 2 : ℕ) ! : ℝ) - ((n + 1 : ℕ) ! : ℝ)) = ((n + 1 : ℕ) ^ 2 * n ! : ℝ) := by
      hole_9
    have h₇ : ((n + 1 : ℕ) : ℝ) ^ 2 = (((n + 2 : ℕ) ! : ℝ) - ((n + 1 : ℕ) ! : ℝ)) / (n ! : ℝ) := by
      rw [h₆]
      have h₈ : (n ! : ℝ) ≠ 0 := by
        hole_11
      hole_10
    hole_2
  
  have h₂ : ∃ x : ℕ, (x : ℝ) ^ 2 = ((n + 2)! - (n + 1)!) / n ! := by
    hole_12
  
  hole_1