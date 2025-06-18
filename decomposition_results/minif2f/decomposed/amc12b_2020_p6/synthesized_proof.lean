theorem amc12b_2020_p6 (n : ℕ) (h₀ : 9 ≤ n) : ∃ x : ℕ, (x : ℝ) ^ 2 = ((n + 2)! - (n + 1)!) / n ! := by
  have h₁ : ((n + 1 : ℕ) : ℝ) ^ 2 = ((n + 2)! - (n + 1)!) / n ! := by
    have h₂ : (n + 2 : ℕ) ! = (n + 2 : ℕ) * (n + 1 : ℕ) * n ! := by
      have h₃ : (n + 2 : ℕ) ! = (n + 2 : ℕ) * (n + 1 : ℕ) * n ! := by
        admit
      admit
    have h₃ : (n + 1 : ℕ) ! = (n + 1 : ℕ) * n ! := by
      have h₄ : (n + 1 : ℕ) ! = (n + 1 : ℕ) * n ! := by
        norm_cast
      norm_cast
    have h₄ : ((n + 2 : ℕ) ! : ℝ) = ((n + 2 : ℕ) * (n + 1 : ℕ) * n ! : ℝ) := by
      admit
    have h₅ : ((n + 1 : ℕ) ! : ℝ) = ((n + 1 : ℕ) * n ! : ℝ) := by
      norm_cast
    have h₆ : (((n + 2 : ℕ) ! : ℝ) - ((n + 1 : ℕ) ! : ℝ)) = ((n + 1 : ℕ) ^ 2 * n ! : ℝ) := by
      admit
    have h₇ : ((n + 1 : ℕ) : ℝ) ^ 2 = (((n + 2 : ℕ) ! : ℝ) - ((n + 1 : ℕ) ! : ℝ)) / (n ! : ℝ) := by
      rw [h₆]
      have h₈ : (n ! : ℝ) ≠ 0 := by
        positivity
      admit0
    admit
  
  have h₂ : ∃ x : ℕ, (x : ℝ) ^ 2 = ((n + 2)! - (n + 1)!) / n ! := by
    admit
  
  hole_1
