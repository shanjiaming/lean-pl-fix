theorem mathd_algebra_419 (a b : ℝ) (h₀ : a = -1) (h₁ : b = 5) : -a - b ^ 2 + 3 * (a * b) = -39 := by
  have h₂ : -a = 1 := by
    rw [h₀]
    <;> norm_num
  
  have h₃ : b ^ 2 = 25 := by
    rw [h₁]
    <;> norm_num
  
  have h₄ : 3 * (a * b) = -15 := by
    rw [h₀, h₁]
    <;> norm_num
  
  have h₅ : -a - b ^ 2 + 3 * (a * b) = -39 := by
    rw [h₂, h₃, h₄]
    <;> norm_num
  
  exact h₅