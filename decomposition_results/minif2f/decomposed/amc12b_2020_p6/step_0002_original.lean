theorem h₁ (n : ℕ) (h₀ : 9 ≤ n) : ↑(n + 1) ^ 2 = (↑(n + 2)! - ↑(n + 1)!) / ↑n ! :=
  by
  have h₂ : (n + 2 : ℕ)! = (n + 2 : ℕ) * (n + 1 : ℕ) * n ! := by sorry
  have h₃ : (n + 1 : ℕ)! = (n + 1 : ℕ) * n ! := by sorry
  have h₄ : ((n + 2 : ℕ)! : ℝ) = ((n + 2 : ℕ) * (n + 1 : ℕ) * n ! : ℝ) := by sorry
  have h₅ : ((n + 1 : ℕ)! : ℝ) = ((n + 1 : ℕ) * n ! : ℝ) := by sorry
  have h₆ : (((n + 2 : ℕ)! : ℝ) - ((n + 1 : ℕ)! : ℝ)) = ((n + 1 : ℕ) ^ 2 * n ! : ℝ) := by sorry
  have h₇ : ((n + 1 : ℕ) : ℝ) ^ 2 = (((n + 2 : ℕ)! : ℝ) - ((n + 1 : ℕ)! : ℝ)) / (n ! : ℝ) := by sorry
  simpa using h₇