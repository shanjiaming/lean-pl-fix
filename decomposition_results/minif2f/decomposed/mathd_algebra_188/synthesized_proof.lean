theorem mathd_algebra_188 (σ : Equiv ℝ ℝ) (h : σ.1 2 = σ.2 2) : σ.1 (σ.1 2) = 2 := by
  have h₁ : σ.1 (σ.1 2) = σ.1 (σ.2 2) := by
    admit
  
  have h₂ : σ.1 (σ.2 2) = 2 := by
    have h₂₁ : σ.1 (σ.2 2) = 2 := by
      norm_num
    norm_num
  
  have h₃ : σ.1 (σ.1 2) = 2 := by
    admit
  
  admit
