macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2023_a3
: sInf {r > 0 | ∃ f g : ℝ → ℝ,
    Differentiable ℝ f ∧ Differentiable ℝ g ∧
    (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧
    f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} = ((Real.pi / 2) : ℝ ) := by
  have h_main : sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} = Real.pi / 2 := by
    have h_pi_div_two_mem : Real.pi / 2 ∈ {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} := by
      have h₀ : Real.pi / 2 > 0 := by hole_4
      refine' ⟨h₀, ⟨fun x => Real.cos x, fun x => -Real.sin x, _⟩⟩
      have h₁ : Differentiable ℝ fun x : ℝ => Real.cos x := by
        hole_5
      have h₂ : Differentiable ℝ fun x : ℝ => -Real.sin x := by
        hole_6
      constructor
      · exact h₁
      constructor
      · exact h₂
      constructor
      · intro x
        have h₃ : deriv (fun x : ℝ => Real.cos x) x = -Real.sin x := by
          hole_7
        have h₄ : deriv (fun x : ℝ => -Real.sin x) x = -Real.cos x := by
          hole_8
        constructor
        · 
          rw [h₃]
          simp [abs_mul, abs_of_nonneg, abs_of_nonpos, Real.sin_le_one, Real.cos_le_one,
            Real.sin_le_one, Real.cos_le_one, abs_neg, abs_mul, abs_of_nonneg, abs_of_nonpos,
            Real.sin_le_one, Real.cos_le_one, Real.sin_le_one, Real.cos_le_one]
          <;>
          cases' le_total 0 (Real.sin x) with h₅ h₅ <;>
          cases' le_total 0 (Real.cos x) with h₆ h₆ <;>
          simp_all [abs_of_nonneg, abs_of_nonpos, Real.sin_le_one, Real.cos_le_one,
            Real.sin_le_one, Real.cos_le_one] <;>
          nlinarith [Real.sin_sq_add_cos_sq x, Real.sin_le_one x, Real.cos_le_one x,
            Real.sin_le_one x, Real.cos_le_one x]
        · 
          rw [h₄]
          simp [abs_mul, abs_of_nonneg, abs_of_nonpos, Real.sin_le_one, Real.cos_le_one,
            Real.sin_le_one, Real.cos_le_one, abs_neg, abs_mul, abs_of_nonneg, abs_of_nonpos,
            Real.sin_le_one, Real.cos_le_one, Real.sin_le_one, Real.cos_le_one]
          <;>
          cases' le_total 0 (Real.sin x) with h₅ h₅ <;>
          cases' le_total 0 (Real.cos x) with h₆ h₆ <;>
          simp_all [abs_of_nonneg, abs_of_nonpos, Real.sin_le_one, Real.cos_le_one,
            Real.sin_le_one, Real.cos_le_one] <;>
          nlinarith [Real.sin_sq_add_cos_sq x, Real.sin_le_one x, Real.cos_le_one x,
            Real.sin_le_one x, Real.cos_le_one x]
      constructor
      · 
        norm_num [Real.cos_zero, Real.sin_zero]
      constructor
      · 
        norm_num [Real.cos_zero, Real.sin_zero]
      · 
        have h₅ : (Real.cos (Real.pi / 2) : ℝ) = 0 := by hole_9
        hole_3
    
    have h_le_pi_div_two : sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≤ Real.pi / 2 := by
      have h₁ : Real.pi / 2 ∈ {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} := h_pi_div_two_mem
      have h₂ : sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≤ Real.pi / 2 := by
        apply csInf_le
        · 
          refine' ⟨0, _⟩
          intro r hr
          
          have h₃ : r > 0 := hr.1
          hole_11
      hole_10
    
    have h_ge_pi_div_two : sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≥ Real.pi / 2 := by
      have h₁ : Real.pi / 2 ∈ {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} := h_pi_div_two_mem
      
      
      have h₂ : ∀ r ∈ {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0}, r ≥ Real.pi / 2 := by
        intro r hr
        have h₃ : r > 0 := by hole_14
        have h₄ : ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0 := by hole_15
        rcases h₄ with ⟨f, g, hf, hg, hfg, hf0, hg0, hfr⟩
        
        have h₅ : r ≥ Real.pi / 2 := by
          by_contra h
          
          have h₆ : r < Real.pi / 2 := by hole_17
          
          have h₇ : f 0 > 0 := hf0
          have h₈ : g 0 = 0 := hg0
          have h₉ : f r = 0 := hfr
          have h₁₀ : ∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x| := hfg
          
          
          have h₁₁ := h₁₀ 0
          have h₁₂ := h₁₀ r
          have h₁₃ : |deriv f 0| ≤ |g 0| := by hole_18
          have h₁₄ : |deriv g 0| ≤ |f 0| := by hole_19
          have h₁₅ : |deriv f r| ≤ |g r| := by hole_20
          have h₁₆ : |deriv g r| ≤ |f r| := by hole_21
          
          have h₁₇ : g 0 = 0 := hg0
          have h₁₈ : f 0 > 0 := hf0
          have h₁₉ : f r = 0 := hfr
          have h₂₀ : |deriv f 0| ≤ 0 := by
            hole_22
          have h₂₁ : deriv f 0 = 0 := by
            have h₂₂ : |deriv f 0| ≤ 0 := h₂₀
            have h₂₃ : deriv f 0 = 0 := by
              have h₂₄ : |deriv f 0| ≤ 0 := h₂₂
              have h₂₅ : |deriv f 0| ≥ 0 := abs_nonneg (deriv f 0)
              have h₂₆ : |deriv f 0| = 0 := by hole_25
              have h₂₇ : deriv f 0 = 0 := by hole_26
              hole_24
            hole_23
          have h₂₂ : |deriv g 0| ≤ f 0 := by
            hole_27
          
          
          have h₂₃ : False := by
            
            have h₂₄ : 0 < Real.pi := by hole_29
            have h₂₅ : 0 < Real.pi / 2 := by hole_30
            
            
            hole_28
          hole_16
        hole_13
      have h₃ : sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} ≥ Real.pi / 2 := by
        have h₄ : ∀ r ∈ {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0}, r ≥ Real.pi / 2 := h₂
        have h₅ : Real.pi / 2 ≤ sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} := by
          
          apply le_csInf
          · 
            exact ⟨Real.pi / 2, h_pi_div_two_mem⟩
          · 
            intro r hr
            have h₆ : r ≥ Real.pi / 2 := h₄ r hr
            hole_32
        hole_31
      hole_12
    
    
    have h_eq : sInf {r > 0 | ∃ f g : ℝ → ℝ, Differentiable ℝ f ∧ Differentiable ℝ g ∧ (∀ x : ℝ, |deriv f x| ≤ |g x| ∧ |deriv g x| ≤ |f x|) ∧ f 0 > 0 ∧ g 0 = 0 ∧ f r = 0} = Real.pi / 2 := by
      hole_33
    hole_2
  
  hole_1