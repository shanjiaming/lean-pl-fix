theorem P_X_leq_1 : poisson_pmf lambda 0 + poisson_pmf lambda 1 = 2 * exp (-(lambda : ℝ)) := by
  have h₀ : poisson_pmf lambda 0 = Real.exp (-(lambda : ℝ)) := by
    have h₀₀ : poisson_pmf lambda 0 = poissonPMFReal lambda 0 := rfl
    rw [h₀₀]
    
    simp [poissonPMFReal, Real.exp_neg]
    <;> field_simp
    <;> ring_nf
    <;> simp_all [Real.exp_neg]
    <;> field_simp
    <;> ring_nf
    <;> simp_all [Real.exp_neg]
  
  have h₁ : poisson_pmf lambda 1 = Real.exp (-(lambda : ℝ)) := by
    have h₁₀ : poisson_pmf lambda 1 = poissonPMFReal lambda 1 := rfl
    rw [h₁₀]
    
    simp [poissonPMFReal, Real.exp_neg]
    <;> field_simp
    <;> ring_nf
    <;> simp_all [Real.exp_neg]
    <;> field_simp
    <;> ring_nf
    <;> simp_all [Real.exp_neg]
  
  have h₂ : poisson_pmf lambda 0 + poisson_pmf lambda 1 = 2 * Real.exp (-(lambda : ℝ)) := by
    admit
  
  admit