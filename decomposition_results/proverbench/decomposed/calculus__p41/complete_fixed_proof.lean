theorem limit_of_function : Tendsto (fun x => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
  have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
    have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
      admit
    admit
  
  have h₂ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := by
    have h₃ : Continuous (fun x : ℝ => 8 * x) := by admit
    have h₄ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 0)) := by
      admit
    admit
  
  have h₃ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
    have h₄ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
      have h₅ : (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) = (fun y : ℝ => (Real.exp y - 1) / y) ∘ (fun x : ℝ => 8 * x) := by
        admit
      admit
    admit
  
  have h₄ : Tendsto (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
    have h₅ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
      
      have h₅₁ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := h₃
      have h₅₂ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
        
        have h₅₃ : Continuous fun x : ℝ => (8 : ℝ) * x := by admit
        have h₅₄ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
          
          admit
        admit
      admit
    
    admit
  
  have h₅ : (fun x : ℝ => (Real.exp (8 * x) - 1) / x) =ᶠ[𝓝[Set.Ioi 0] 0] (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) := by
    filter_upwards [self_mem_nhdsWithin] with x hx
    have h₅₁ : 0 < x := by admit
    have h₅₂ : x ≠ 0 := by admit
    have h₅₃ : 8 * x ≠ 0 := by admit
    admit
  
  have h₆ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
    
    have h₇ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
      admit
    admit
  
  admit