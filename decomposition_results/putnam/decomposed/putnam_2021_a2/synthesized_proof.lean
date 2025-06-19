theorem putnam_2021_a2
(g : ℝ → ℝ)
(hg : ∀ x > 0, Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)))
: Tendsto (fun x : ℝ => g x / x) atTop (𝓝 ((Real.exp 1) : ℝ )) := by
  have h_main : Tendsto (fun x => g x / x) atTop (𝓝 (Real.exp 1)) := by
    have h₁ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by
      have h₂ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := by
        
        have h₃ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := by
          admit
        norm_cast
      have h₄ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by
        have h₅ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by
          have h₆ : (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) = (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) := by
            admit
          rw [h₆]
          have h₇ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) atTop (𝓝 (Real.exp 1 * (1 : ℝ))) := by
            
            have h₈ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := h₂
            have h₉ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ)) atTop (𝓝 1) := by
              admit
            have h₁₀ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) atTop (𝓝 (Real.exp 1 * 1)) := by
              
              have h₁₁ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := h₂
              have h₁₂ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ)) atTop (𝓝 1) := h₉
              have h₁₃ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x * (1 + 1 / x : ℝ)) atTop (𝓝 (Real.exp 1 * 1)) := by
                admit
              norm_cast
            norm_cast
          have h₁₁ : (Real.exp 1 * (1 : ℝ)) = Real.exp 1 := by norm_num
          admit
        norm_cast
      norm_cast
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

                    admit
                  norm_cast
                norm_cast
              norm_cast
            norm_cast
          have h₁₀ : g x = (x + 1) ^ (x + 1) / x ^ x := by
            
            have h₁₁ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)) := h₅
            have h₁₂ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 ((x + 1) ^ (x + 1) / x ^ x)) := h₇
            have h₁₃ : g x = (x + 1) ^ (x + 1) / x ^ x := by
              
              admit
            linarith
          linarith
        linarith
      have h₅ : g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
        have h₆ : g x = (x + 1) ^ (x + 1) / x ^ x := h₄
        rw [h₆]
        have h₇ : (x + 1 : ℝ) ^ (x + 1) / x ^ x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
          have h₈ : 0 < x := by linarith
          have h₉ : 0 < (x : ℝ) := by linarith
          
          have h₁₀ : (x + 1 : ℝ) ^ (x + 1) / x ^ x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
            have h₁₁ : (x + 1 : ℝ) ^ (x + 1) / x ^ x / x = ((x + 1 : ℝ) ^ (x + 1) / x ^ x) / x := by norm_num
            rw [h₁₁]
            have h₁₂ : (x + 1 : ℝ) ^ (x + 1) / x ^ x = (x + 1 : ℝ) ^ (x + 1) / x ^ x := by norm_num
            rw [h₁₂]
            have h₁₃ : ((x + 1 : ℝ) ^ (x + 1) / x ^ x) / x = (x + 1 : ℝ) ^ (x + 1) / (x ^ x * x) := by
              ring
            rw [h₁₃]
            have h₁₄ : (x + 1 : ℝ) ^ (x + 1) / (x ^ x * x) = (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) := by
              have h₁₅ : (x : ℝ) ^ x * x = (x : ℝ) ^ (x + 1) := by
                have h₁₆ : (x : ℝ) ^ x * x = (x : ℝ) ^ (x + 1) := by
                  admit
                linarith
              admit
            rw [h₁₄]
            have h₁₅ : (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) = (1 + 1 / x : ℝ) ^ (x + 1) := by
              have h₁₆ : (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) = ((x + 1 : ℝ) / x) ^ (x + 1) := by
                have h₁₇ : (x + 1 : ℝ) ^ (x + 1) / x ^ (x + 1) = ((x + 1 : ℝ) / x) ^ (x + 1) := by
                  admit
                linarith
              rw [h₁₆]
              have h₁₇ : ((x + 1 : ℝ) / x : ℝ) = (1 + 1 / x : ℝ) := by
                field_simp
              field_simp
            linarith
          linarith
        linarith
      linarith
    have h₃ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by
      have h₄ : ∀ᶠ (x : ℝ) in atTop, g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by
        admit
      have h₅ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by
        have h₆ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := h₁
        have h₇ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by
          admit
        simpa
      simpa
    simpa
  simpa
