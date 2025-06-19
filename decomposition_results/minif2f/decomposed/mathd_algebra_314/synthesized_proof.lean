theorem mathd_algebra_314 (n : ℕ) (h₀ : n = 11) : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 1 / 4 := by
  have h₁ : 1 / 4 = 0 := by
    norm_num
  
  have h₂ : (1 / 4) ^ (n + 1) = 0 := by
    rw [h₁]
    have h₂₁ : n + 1 > 0 := by
      have h₂₁₁ : n ≥ 0 := by norm_num
      norm_num
    
    have h₂₂ : 0 ^ (n + 1) = 0 := by
      have h₂₂₁ : n + 1 ≠ 0 := by norm_num
      norm_num
    norm_num
  
  have h₃ : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 0 := by
    norm_num
  
  have h₄ : 1 / 4 = 0 := by
    norm_num
  
  have h₅ : (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 1 / 4 := by
    norm_num
  
  norm_num
