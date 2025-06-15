theorem limit_of_function_as_x_approaches_zero :
  Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
  have h₀ : HasDerivAt (fun x : ℝ => (3 : ℝ)^x) (Real.log 3) 0 := by
    
    have h₁ : HasDerivAt (fun x : ℝ => (3 : ℝ) ^ x) (Real.log 3 * (3 : ℝ) ^ (0 : ℝ)) 0 := by
      
      admit
    
    admit
  
  have h₁ : Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
    
    have h₂ : Tendsto (fun x => ((3 : ℝ)^x - (3 : ℝ)^(0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
      
      have h₃ : Tendsto (fun x => ((3 : ℝ)^x - (3 : ℝ)^(0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
        admit
      admit
    
    have h₄ : Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
      admit
    admit
  
  admit