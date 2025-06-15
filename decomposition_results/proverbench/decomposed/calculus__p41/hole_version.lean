macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem limit_of_function : Tendsto (fun x => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
  have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
    have h₂ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by
      hole_3
    hole_2
  
  have h₂ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := by
    have h₃ : Continuous (fun x : ℝ => 8 * x) := by hole_5
    have h₄ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 0)) := by
      hole_6
    hole_4
  
  have h₃ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
    have h₄ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by
      have h₅ : (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) = (fun y : ℝ => (Real.exp y - 1) / y) ∘ (fun x : ℝ => 8 * x) := by
        hole_9
      hole_8
    hole_7
  
  have h₄ : Tendsto (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
    have h₅ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
      
      have h₅₁ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := h₃
      have h₅₂ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
        
        have h₅₃ : Continuous fun x : ℝ => (8 : ℝ) * x := by hole_13
        have h₅₄ : Tendsto (fun x : ℝ => (8 : ℝ) * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 (8 * 1)) := by
          
          hole_14
        hole_12
      hole_11
    
    hole_10
  
  have h₅ : (fun x : ℝ => (Real.exp (8 * x) - 1) / x) =ᶠ[𝓝[Set.Ioi 0] 0] (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) := by
    filter_upwards [self_mem_nhdsWithin] with x hx
    have h₅₁ : 0 < x := by hole_16
    have h₅₂ : x ≠ 0 := by hole_17
    have h₅₃ : 8 * x ≠ 0 := by hole_18
    hole_15
  
  have h₆ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
    
    have h₇ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by
      hole_20
    hole_19
  
  hole_1