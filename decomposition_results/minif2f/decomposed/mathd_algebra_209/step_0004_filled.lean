theorem h₃₂ (σ : ℝ ≃ ℝ) (h₀ : σ.invFun 2 = 10) (h₁ : σ.invFun 10 = 1) (h₂ : σ.invFun 1 = 2) : σ.toFun (σ.invFun 10) = 10 := by -- apply Equiv.apply_symm_apply
  norm_num