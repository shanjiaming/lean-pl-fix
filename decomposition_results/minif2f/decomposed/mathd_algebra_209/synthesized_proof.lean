theorem mathd_algebra_209 (σ : Equiv ℝ ℝ) (h₀ : σ.2 2 = 10) (h₁ : σ.2 10 = 1) (h₂ : σ.2 1 = 2) :
    σ.1 (σ.1 10) = 1 := by
  have h₃ : σ.1 1 = 10 := by
    have h₃₁ : σ.1 1 = 10 := by
      have h₃₂ : σ.1 (σ.2 10) = 10 := by
        norm_num
      admit
    linarith
  
  have h₄ : σ.1 2 = 1 := by
    have h₄₁ : σ.1 (σ.2 1) = 1 := by
      norm_num
    admit
  
  have h₅ : σ.1 10 = 2 := by
    have h₅₁ : σ.1 (σ.2 2) = 2 := by
      norm_num
    admit
  
  have h₆ : σ.1 (σ.1 10) = 1 := by
    admit
  
  linarith
