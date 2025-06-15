theorem limit_of_function_at_zero :
    Tendsto (fun x => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
  have h1 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
    have h₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
      have h₂ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝 0) (𝓝 (3 / 5)) := by
        
        have h₃ : ContinuousAt (fun x : ℝ => (3 + x) / (5 + 2 * x)) 0 := by
          
          admit
        
        admit
      
      have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
        have h₅ : ∀ x : ℝ, x ≠ 0 → (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2) = (3 + x) / (5 + 2 * x) := by
          intro x hx
          have h₆ : x ≠ 0 := hx
          have h₇ : 5 * x + 2 * x ^ 2 = x * (5 + 2 * x) := by admit
          have h₈ : 3 * x + x ^ 2 = x * (3 + x) := by admit
          rw [h₇, h₈]
          have h₉ : x ≠ 0 := hx
          admit
        have h₉ : (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) =ᶠ[𝓝[≠] 0] (fun x : ℝ => (3 + x) / (5 + 2 * x)) := by
          admit
        
        have h₁₀ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h₂.mono_left nhdsWithin_le_nhds
        have h₁₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          admit
        admit
      admit
    
    have h₂ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
      
      have h₃ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h₁
      have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
        admit
      admit
    admit
  
  have h2 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
    
    have h2 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝 0) (𝓝 0) := by
      have h2 : Continuous (fun x : ℝ => 3 * x + x ^ 2) := by admit
      admit
    have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
      have h4 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := by
        have h5 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝 0) := h2.mono_left nhdsWithin_le_nhds
        have h6 : ∀ᶠ (x : ℝ) in 𝓝[≠] 0, 3 * x + x ^ 2 ≠ 0 := by
          admit
        admit
      admit
    admit
  
  have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
    have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
      have h4 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
        have h5 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := h2
        have h6 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          have h7 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := h1
          have h8 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h7.mono_left nhdsWithin_le_nhds
          admit
        have h9 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
          have h10 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
            have h11 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
              
              have h12 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2))) (𝓝[≠] 0) (𝓝 1) := h2
              have h13 : Tendsto (fun x : ℝ => ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (3 / 5)) := h6
              have h14 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
                
                admit
              admit
            admit
          admit
        admit
      have h10 : (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := by
        filter_upwards [self_mem_nhdsWithin] with x hx
        have h11 : x ≠ 0 := hx
        by_cases h12 : 3 * x + x ^ 2 = 0
        · have h13 : x = 0 ∨ x = -3 := by
            admit
          cases h13 with
          | inl h13 =>
            exfalso
            apply h11
            linarith
          | inr h13 =>
            simp_all [h13]
            <;> ring_nf at *
            <;> norm_num at *
            <;>
            (try
              {
                linarith
              })
            <;>
            (try
              {
                ring_nf at *
                <;> norm_num at *
                <;>
                linarith
              })
        · have h13 : 3 * x + x ^ 2 ≠ 0 := h12
          by_cases h14 : 5 * x + 2 * x ^ 2 = 0
          · have h15 : x = 0 ∨ x = -5 / 2 := by
              admit
            cases h15 with
            | inl h15 =>
              exfalso
              apply h11
              linarith
            | inr h15 =>
              simp_all [h15]
              <;> ring_nf at *
              <;> norm_num at *
              <;>
              (try
                {
                  linarith
                })
              <;>
              (try
                {
                  ring_nf at *
                  <;> norm_num at *
                  <;>
                  linarith
                })
          · have h15 : 5 * x + 2 * x ^ 2 ≠ 0 := h14
            admit
      have h16 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
        have h17 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := h4
        have h18 : (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := h10
        have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := h17.congr' h18
        have h20 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          admit
        admit
      admit
    have h17 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
      have h18 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h3
      have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
        admit
      admit
    admit
  admit