macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem limit_of_function_at_zero :
    Tendsto (fun x => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
  have h1 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
    have h₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
      have h₂ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝 0) (𝓝 (3 / 5)) := by
        
        have h₃ : ContinuousAt (fun x : ℝ => (3 + x) / (5 + 2 * x)) 0 := by
          
          hole_5
        
        hole_4
      
      have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
        have h₅ : ∀ x : ℝ, x ≠ 0 → (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2) = (3 + x) / (5 + 2 * x) := by
          intro x hx
          have h₆ : x ≠ 0 := hx
          have h₇ : 5 * x + 2 * x ^ 2 = x * (5 + 2 * x) := by hole_8
          have h₈ : 3 * x + x ^ 2 = x * (3 + x) := by hole_9
          rw [h₇, h₈]
          have h₉ : x ≠ 0 := hx
          hole_7
        have h₉ : (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) =ᶠ[𝓝[≠] 0] (fun x : ℝ => (3 + x) / (5 + 2 * x)) := by
          hole_10
        
        have h₁₀ : Tendsto (fun x : ℝ => (3 + x) / (5 + 2 * x)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h₂.mono_left nhdsWithin_le_nhds
        have h₁₁ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          hole_11
        hole_6
      hole_3
    
    have h₂ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
      
      have h₃ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h₁
      have h₄ : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
        hole_13
      hole_12
    hole_2
  
  have h2 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
    
    have h2 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝 0) (𝓝 0) := by
      have h2 : Continuous (fun x : ℝ => 3 * x + x ^ 2) := by hole_16
      hole_15
    have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := by
      have h4 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝[≠] 0) := by
        have h5 : Tendsto (fun x : ℝ => 3 * x + x ^ 2) (𝓝[≠] 0) (𝓝 0) := h2.mono_left nhdsWithin_le_nhds
        have h6 : ∀ᶠ (x : ℝ) in 𝓝[≠] 0, 3 * x + x ^ 2 ≠ 0 := by
          hole_19
        hole_23
      hole_17
    hole_14
  
  have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
    have h3 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
      have h4 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
        have h5 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) (𝓝[≠] 0) (𝓝 1) := h2
        have h6 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          have h7 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := h1
          have h8 : Tendsto (fun x : ℝ => (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h7.mono_left nhdsWithin_le_nhds
          hole_29
        have h9 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
          have h10 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
            have h11 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
              
              have h12 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2))) (𝓝[≠] 0) (𝓝 1) := h2
              have h13 : Tendsto (fun x : ℝ => ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (3 / 5)) := h6
              have h14 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := by
                
                hole_33
              hole_32
            hole_31
          hole_30
        hole_28
      have h10 : (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := by
        filter_upwards [self_mem_nhdsWithin] with x hx
        have h11 : x ≠ 0 := hx
        by_cases h12 : 3 * x + x ^ 2 = 0
        · have h13 : x = 0 ∨ x = -3 := by
            hole_35
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
              hole_36
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
            hole_34
      have h16 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
        have h17 : Tendsto (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := h4
        have h18 : (fun x : ℝ => (Real.sin (3 * x + x ^ 2) / (3 * x + x ^ 2)) * ((3 * x + x ^ 2) / (5 * x + 2 * x ^ 2))) =ᶠ[𝓝[≠] 0] (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) := h10
        have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (1 * (3 / 5))) := h17.congr' h18
        have h20 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := by
          hole_38
        hole_37
      hole_27
    have h17 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
      have h18 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝[≠] 0) (𝓝 (3 / 5)) := h3
      have h19 : Tendsto (fun x : ℝ => Real.sin (3 * x + x ^ 2) / (5 * x + 2 * x ^ 2)) (𝓝 0) (𝓝 (3 / 5)) := by
        hole_40
      hole_39
    hole_26
  hole_1