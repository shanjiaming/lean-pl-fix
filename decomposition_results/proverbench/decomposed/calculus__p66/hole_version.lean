macro "hole_1" : tactic => `(tactic| admit)

theorem integral_x_ln_x_over_interval :
∫ x in Set.Icc 1 5, x * Real.log x = (25 * Real.log 5 - 12) / 2 := by
  have h₀ : (∫ x in Set.Icc 1 5, x * Real.log x) = (25 * Real.log 5 - 12) / 2 := by
    have h₁ : ∫ x in Set.Icc 1 5, x * Real.log x = ∫ x in (1 : ℝ)..5, x * Real.log x := by
      
      hole_1
    rw [h₁]
    
    have h₂ : ∫ x in (1 : ℝ)..5, x * Real.log x = (25 * Real.log 5 - 12) / 2 := by
      
      have h₃ : ∫ x in (1 : ℝ)..5, x * Real.log x = ( (5 : ℝ)^2 / 2 * Real.log 5 - (5 : ℝ)^2 / 4 ) - ( (1 : ℝ)^2 / 2 * Real.log 1 - (1 : ℝ)^2 / 4 ) := by
        
        have h₄ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x - (x : ℝ)^2 / 4) ( ( (5 : ℝ) * Real.log 5 ) ), 5 := by
          
          have h₅ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x - (x : ℝ)^2 / 4) ((5 : ℝ) * Real.log 5) 5 := by
            
            have h₆ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x) ((5 : ℝ) * Real.log 5 + 5 / 2) 5 := by
              
              have h₇ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2) 5 5 := by
                
                have h₈ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2) ((2 * 5) / 2) 5 := by
                  
                  convert HasDerivAt.div_const (hasDerivAt_pow 2 (5 : ℝ)) 2 using 1 <;> ring_nf <;> norm_num
                convert h₈ using 1 <;> ring_nf <;> norm_num
              have h₉ : HasDerivAt (fun x : ℝ => Real.log x) (1 / 5) 5 := by
                
                have h₁₀ : HasDerivAt (fun x : ℝ => Real.log x) (1 / 5) 5 := by
                  convert HasDerivAt.log (hasDerivAt_id 5) (by norm_num) using 1 <;> field_simp <;> ring_nf <;> norm_num
                exact h₁₀
              have h₁₁ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x) ((5 : ℝ) * Real.log 5 + 5 / 2) 5 := by
                
                convert h₇.mul h₉ using 1 <;>
                  (try norm_num) <;>
                  (try ring_nf) <;>
                  (try field_simp [Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div, Real.log_one, Real.log_zero, sub_eq_add_neg]) <;>
                  (try norm_num) <;>
                  (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]) <;>
                  (try ring_nf) <;>
                  (try norm_num) <;>
                  (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)])
              exact h₁₁
            have h₁₂ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 4) (5 / 2) 5 := by
              
              have h₁₃ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 4) ((2 * 5) / 4) 5 := by
                
                convert HasDerivAt.div_const (hasDerivAt_pow 2 (5 : ℝ)) 4 using 1 <;> ring_nf <;> norm_num
              convert h₁₃ using 1 <;> ring_nf <;> norm_num
            have h₁₄ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x - (x : ℝ)^2 / 4) ((5 : ℝ) * Real.log 5) 5 := by
              
              convert h₆.sub h₁₂ using 1 <;>
                (try norm_num) <;>
                (try ring_nf) <;>
                (try field_simp [Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div, Real.log_one, Real.log_zero, sub_eq_add_neg]) <;>
                (try norm_num) <;>
                (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]) <;>
                (try ring_nf) <;>
                (try norm_num) <;>
                (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)])
            exact h₁₄
          exact h₅
        have h₅ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x - (x : ℝ)^2 / 4) ( ( (1 : ℝ) * Real.log 1 ) ) 1 := by
          
          have h₆ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x - (x : ℝ)^2 / 4) ((1 : ℝ) * Real.log 1) 1 := by
            
            have h₇ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x) ((1 : ℝ) * Real.log 1 + 1 / 2) 1 := by
              
              have h₈ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2) 1 1 := by
                
                have h₉ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2) ((2 * 1) / 2) 1 := by
                  
                  convert HasDerivAt.div_const (hasDerivAt_pow 2 (1 : ℝ)) 2 using 1 <;> ring_nf <;> norm_num
                convert h₉ using 1 <;> ring_nf <;> norm_num
              have h₁₀ : HasDerivAt (fun x : ℝ => Real.log x) (1 / 1) 1 := by
                
                have h₁₁ : HasDerivAt (fun x : ℝ => Real.log x) (1 / 1) 1 := by
                  convert HasDerivAt.log (hasDerivAt_id 1) (by norm_num) using 1 <;> field_simp <;> ring_nf <;> norm_num
                exact h₁₁
              have h₁₂ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x) ((1 : ℝ) * Real.log 1 + 1 / 2) 1 := by
                
                convert h₈.mul h₁₀ using 1 <;>
                  (try norm_num) <;>
                  (try ring_nf) <;>
                  (try field_simp [Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div, Real.log_one, Real.log_zero, sub_eq_add_neg]) <;>
                  (try norm_num) <;>
                  (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]) <;>
                  (try ring_nf) <;>
                  (try norm_num) <;>
                  (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)])
              exact h₁₂
            have h₁₃ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 4) (1 / 2) 1 := by
              
              have h₁₄ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 4) ((2 * 1) / 4) 1 := by
                
                convert HasDerivAt.div_const (hasDerivAt_pow 2 (1 : ℝ)) 4 using 1 <;> ring_nf <;> norm_num
              convert h₁₄ using 1 <;> ring_nf <;> norm_num
            have h₁₅ : HasDerivAt (fun x : ℝ => (x : ℝ)^2 / 2 * Real.log x - (x : ℝ)^2 / 4) ((1 : ℝ) * Real.log 1) 1 := by
              
              convert h₇.sub h₁₃ using 1 <;>
                (try norm_num) <;>
                (try ring_nf) <;>
                (try field_simp [Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div, Real.log_one, Real.log_zero, sub_eq_add_neg]) <;>
                (try norm_num) <;>
                (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]) <;>
                (try ring_nf) <;>
                (try norm_num) <;>
                (try linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)])
            exact h₁₅
          exact h₆
        
        have h₆ : ∫ x in (1 : ℝ)..5, x * Real.log x = ( (5 : ℝ)^2 / 2 * Real.log 5 - (5 : ℝ)^2 / 4 ) - ( (1 : ℝ)^2 / 2 * Real.log 1 - (1 : ℝ)^2 / 4 ) := by
          
          have h₇ : ∫ x in (1 : ℝ)..5, x * Real.log x = ( (5 : ℝ)^2 / 2 * Real.log 5 - (5 : ℝ)^2 / 4 ) - ( (1 : ℝ)^2 / 2 * Real.log 1 - (1 : ℝ)^2 / 4 ) := by
            
            have h₈ : ∫ x in (1 : ℝ)..5, x * Real.log x = ( (5 : ℝ)^2 / 2 * Real.log 5 - (5 : ℝ)^2 / 4 ) - ( (1 : ℝ)^2 / 2 * Real.log 1 - (1 : ℝ)^2 / 4 ) := by
              
              norm_num [intervalIntegral.integral_eq_sub_of_hasDerivAt, h₄, h₅, Real.log_one, Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div, sub_eq_add_neg]
              <;>
              ring_nf
              <;>
              norm_num
              <;>
              linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]
            exact h₈
          exact h₇
        exact h₆
      rw [h₃]
      
      have h₄ : Real.log 1 = 0 := by norm_num
      have h₅ : Real.log 5 > 0 := Real.log_pos (by norm_num)
      norm_num [h₄, h₅]
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      linarith [Real.log_pos (by norm_num : (1 : ℝ) < 5)]
    rw [h₂]
  rw [h₀]