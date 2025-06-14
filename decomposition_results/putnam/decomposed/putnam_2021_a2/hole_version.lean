macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2021_a2
(g : ℝ → ℝ)
(hg : ∀ x > 0, Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)))
: Tendsto (fun x : ℝ => g x / x) atTop (𝓝 ((Real.exp 1) : ℝ )) := by
  have h_main : Tendsto (fun x => g x / x) atTop (𝓝 (Real.exp 1)) := by
    have h₁ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by
      have h₂ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := by
        
        have h₃ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := by
          hole_5
        hole_4
      have h₄ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by
        have h₅ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by
          have h₆ : (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) = (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) := by
            hole_8
          rw [h₆]
          have h₇ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) atTop (𝓝 (Real.exp 1 * (1 : ℝ))) := by
            
            have h₈ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := h₂
            have h₉ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ)) atTop (𝓝 1) := by
              hole_10
            have h₁₀ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) atTop (𝓝 (Real.exp 1 * 1)) := by
              
              have h₁₁ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := h₂
              have h₁₂ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ)) atTop (𝓝 1) := h₉
              have h₁₃ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) atTop (𝓝 (Real.exp 1 * 1)) := by
                hole_12
              hole_11
            hole_9
          have h₁₁ : (Real.exp 1 * (1 : ℝ)) = Real.exp 1 := by hole_13
          hole_7
        hole_6
      hole_3
    have h₂ : ∀ (x : ℝ), x > 0 → g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
      intro x hx
      have h₃ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)) := hg x hx
      have h₄ : g x = (x + 1) ^ (x + 1) / x ^ x := by
        have h₅ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)) := hg x hx
        
        have h₆ : g x = (x + 1) ^ (x + 1) / x ^ x := by
          
          have h₇ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := by
            
            have h₈ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := by
              
              have h₉ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := by
                
                have h₁₀ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := by
                  
                  have h₁₁ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := by
                    
                    
                    
                    hole_21
                  hole_20
                hole_19
              hole_18
            hole_17
          have h₁₀ : g x = (x + 1) ^ (x + 1) / x ^ x := by
            
            have h₁₁ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)) := h₅
            have h₁₂ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := h₇
            have h₁₃ : g x = (x + 1) ^ (x + 1) / x ^ x := by
              
              hole_23
            hole_22
          hole_16
        hole_15
      have h₅ : g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
        have h₆ : g x = (x + 1) ^ (x + 1) / x ^ x := h₄
        rw [h₆]
        have h₇ : (x + 1 : ℝ) ^ (x + 1) / x ^ x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
          have h₈ : 0 < x := by hole_26
          have h₉ : 0 < (x : ℝ) := by hole_27
          
          have h₁₀ : (x + 1 : ℝ) ^ (x + 1) / x ^ x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
            have h₁₁ : (x + 1 : ℝ) ^ (x + 1) / x ^ x / x = ((x + 1 : ℝ) ^ (x + 1) / x ^ x) / x := by hole_29
            rw [h₁₁]
            have h₁₂ : (x + 1 : ℝ) ^ (x + 1) / x ^ x = (x + 1 : ℝ) ^ (x + 1) / x ^ x := by hole_30
            rw [h₁₂]
            have h₁₃ : ((x + 1 : ℝ) ^ (x + 1) / x ^ x) / x = (x + 1 : ℝ) ^ (x + 1) / (x ^ x * x) := by
              hole_31
            rw [h₁₃]
            have h₁₄ : (x + 1 : ℝ) ^ (x + 1) / (x ^ x * x) = (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) := by
              have h₁₅ : (x : ℝ) ^ x * x = (x : ℝ) ^ (x + 1) := by
                have h₁₆ : (x : ℝ) ^ x * x = (x : ℝ) ^ (x + 1) := by
                  hole_34
                hole_33
              hole_32
            rw [h₁₄]
            have h₁₅ : (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) = (1 + 1 / x : ℝ) ^ (x + 1) := by
              have h₁₆ : (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) = ((x + 1 : ℝ) / x) ^ (x + 1) := by
                have h₁₇ : (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) = ((x + 1 : ℝ) / x) ^ (x + 1) := by
                  hole_37
                hole_36
              rw [h₁₆]
              have h₁₇ : ((x + 1 : ℝ) / x : ℝ) = (1 + 1 / x : ℝ) := by
                hole_38
              hole_35
            hole_28
          hole_25
        hole_24
      hole_14
    have h₃ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by
      have h₄ : ∀ᶠ (x : ℝ) in atTop, g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
        hole_40
      have h₅ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by
        have h₆ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := h₁
        have h₇ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by
          hole_42
        hole_41
      hole_39
    hole_2
  hole_1