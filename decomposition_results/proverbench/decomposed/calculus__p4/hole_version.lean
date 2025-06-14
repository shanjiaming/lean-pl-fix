macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem limit_of_function_at_3 :
Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x^3 - 6 * x^2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
  have h₀ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
    have h₀₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
      have h₀₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
        
        have h₀₃ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝[≠] 3) (𝓝 (-2)) := by
          have h₀₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝[≠] 3) (𝓝 (-2)) := by
            
            have h₀₅ : (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) = (fun x : ℝ => (-2 : ℝ) * ((Real.sin (x - 3)) / (x - 3))^2) := by
              funext x
              have h₁ : Real.cos (2 * x - 6) - 1 = -2 * Real.sin (x - 3) ^ 2 := by
                have h₂ : Real.cos (2 * x - 6) = Real.cos (2 * (x - 3)) := by hole_9
                rw [h₂]
                have h₃ : Real.cos (2 * (x - 3)) = 1 - 2 * Real.sin (x - 3) ^ 2 := by
                  hole_10
                hole_8
              rw [h₁]
              by_cases h₂ : x - 3 = 0
              · have h₃ : x = 3 := by hole_11
                simp_all
                <;> simp_all
                <;> field_simp
                <;> ring_nf
                <;> norm_num
              · have h₃ : x ≠ 3 := by hole_12
                hole_7
            hole_6
          hole_5
        have h₀₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
          have h₀₆ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝[≠] 3) (𝓝 (-2)) := h₀₃
          have h₀₇ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := by
            hole_14
          hole_13
        hole_4
      hole_3
    hole_2
  
  have h₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := by
    have h₁₁ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := by
      
      have h₁₂ : ContinuousAt (fun x : ℝ => (1 : ℝ) / x) 3 := by
        hole_17
      
      have h₁₃ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 ((1 : ℝ) / 3)) := by
        hole_18
      hole_16
    hole_15
  
  have h₂ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x^3 - 6 * x^2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
    have h₂₁ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3)^2) (𝓝 3) (𝓝 (-2)) := h₀
    have h₂₂ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := h₁
    have h₂₃ : (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) =ᶠ[𝓝 3] (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) := by
      have h₂₄ : ∀ᶠ (x : ℝ) in 𝓝 3, (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by
        filter_upwards [isOpen_ne.mem_nhds (by norm_num : (3 : ℝ) ≠ 0)] with x hx
        have h₂₅ : x ≠ 0 := by
          hole_22
        have h₂₆ : x ≠ 3 → (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by
          intro h₂₆
          have h₂₇ : x ^ 3 - 6 * x ^ 2 + 9 * x = x * (x - 3) ^ 2 := by
            hole_24
          rw [h₂₇]
          have h₂₈ : x ≠ 0 := by
            hole_25
          have h₂₉ : x - 3 ≠ 0 := by
            hole_26
          hole_23
        by_cases h₂₇ : x = 3
        · simp_all
          <;>
          norm_num
        · have h₂₈ : x ≠ 3 := h₂₇
          have h₂₉ : x ≠ 0 := by
            hole_27
          have h₃₀ : (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) = ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by
            hole_28
          hole_21
      hole_20
    have h₂₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
      have h₂₆ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 (-2 / 3)) := by
        have h₂₇ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
          have h₂₈ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
            
            have h₂₉ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) (𝓝 3) (𝓝 (-2)) := h₂₁
            have h₃₀ : Tendsto (fun x : ℝ => (1 : ℝ) / x) (𝓝 3) (𝓝 (1 / 3)) := h₁
            have h₃₁ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
              have h₃₂ : Tendsto (fun x : ℝ => ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x)) (𝓝 3) (𝓝 ((-2 : ℝ) * (1 / 3))) := by
                
                hole_34
              hole_33
            hole_32
          hole_31
        have h₃₃ : ((-2 : ℝ) * (1 / 3) : ℝ) = (-2 / 3 : ℝ) := by hole_35
        hole_30
      have h₃₄ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
        
        have h₃₅ : Tendsto (fun x : ℝ => (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) (𝓝 3) (𝓝 (-2 / 3)) := by
          hole_37
        hole_36
      hole_29
    hole_19
  
  hole_1