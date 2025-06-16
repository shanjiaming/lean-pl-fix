theorem putnam_2006_b5
  (I J : (ℝ → ℝ) → ℝ)
  (hI : I = fun f ↦ ∫ x in (0)..1, x ^ 2 * (f x))
  (hJ : J = fun f ↦ ∫ x in (0)..1, x * (f x) ^ 2) :
  IsGreatest
    {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y}
    ((1 / 16) : ℝ ) := by
  have h₁ : (1 / 16 : ℝ) ∈ {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} := by
    use fun x => x / 2
    constructor
    · 
      apply ContinuousOn.div
      · exact continuousOn_id
      · exact continuousOn_const
      · intro x hx
        norm_num at hx ⊢
        <;> linarith
    · 
      rw [hI, hJ]
      have h₂ : (∫ x in (0)..1, x ^ 2 * ((fun x => x / 2 : ℝ → ℝ) x)) = 1 / 8 := by
        
        admit
      have h₃ : (∫ x in (0)..1, x * ((fun x => x / 2 : ℝ → ℝ) x) ^ 2) = 1 / 16 := by
        
        admit
      admit
  
  have h₂ : ∀ (y : ℝ), y ∈ {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} → y ≤ (1 / 16 : ℝ) := by
    intro y hy
    rcases hy with ⟨f, hf_cont, hf⟩
    have h₃ : I f - J f = y := hf
    have h₄ : I f - J f ≤ (1 / 16 : ℝ) := by
      rw [hI, hJ] at *
      have h₅ : (∫ x in (0)..1, x ^ 2 * f x) - ∫ x in (0)..1, x * (f x) ^ 2 ≤ (1 / 16 : ℝ) := by
        have h₆ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) ≤ (1 / 16 : ℝ) := by
          have h₇ : ∀ x ∈ Set.Icc (0 : ℝ) (1 : ℝ), x ^ 2 * f x - x * (f x) ^ 2 ≤ x ^ 3 / 4 := by
            intro x hx
            have h₈ : 0 ≤ x := by admit
            have h₉ : x ≤ 1 := by admit
            have h₁₀ : x ^ 2 * f x - x * (f x) ^ 2 ≤ x ^ 3 / 4 := by
              
              have h₁₁ : x * (f x) ^ 2 - x ^ 2 * f x + x ^ 3 / 4 ≥ 0 := by
                
                have h₁₂ : x * (f x) ^ 2 - x ^ 2 * f x + x ^ 3 / 4 = x * (f x - x / 2) ^ 2 := by
                  
                  admit
                rw [h₁₂]
                
                have h₁₃ : 0 ≤ x * (f x - x / 2) ^ 2 := by
                  admit
                admit
              admit
            admit
          
          have h₁₅ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) ≤ ∫ x in (0)..1, (x ^ 3 / 4 : ℝ) := by
            admit
          have h₁₆ : (∫ x in (0)..1, (x ^ 3 / 4 : ℝ)) = (1 / 16 : ℝ) := by
            
            norm_num [integral_pow]
            <;>
            simp_all [mul_comm]
            <;>
            norm_num
            <;>
            ring_nf
            <;>
            norm_num
            <;>
            linarith
          rw [h₁₆] at h₁₅
          exact h₁₅
        have h₁₇ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) = (∫ x in (0)..1, x ^ 2 * f x) - ∫ x in (0)..1, x * (f x) ^ 2 := by
          
          have h₁₈ : (∫ x in (0)..1, x ^ 2 * f x - x * (f x) ^ 2) = (∫ x in (0)..1, x ^ 2 * f x) - ∫ x in (0)..1, x * (f x) ^ 2 := by
            rw [intervalIntegral.integral_sub]
            · 
              apply Continuous.intervalIntegrable
              have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by
                exact ContinuousOn.mul (continuousOn_pow 2) (hf_cont)
              exact h₂₀.continuousOn
              apply Continuous.intervalIntegrable
              have h₂₁ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
                exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
              exact h₂₁.continuousOn
            · 
              apply Continuous.intervalIntegrable
              have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by
                exact ContinuousOn.mul (continuousOn_pow 2) (hf_cont)
              exact h₂₀.continuousOn
              apply Continuous.intervalIntegrable
              have h₂₁ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
                exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
              exact h₂₁.continuousOn
          rw [h₁₈]
          <;> simp
        rw [h₁₇] at h₆
        linarith
      linarith
    linarith
  
  have h_main : IsGreatest {y | ∃ f : ℝ → ℝ, ContinuousOn f (Icc 0 1) ∧ I f - J f = y} ((1 / 16 : ℝ)) := by
    refine' ⟨h₁, _⟩
    intro y hy
    have h₃ : y ≤ (1 / 16 : ℝ) := h₂ y hy
    exact h₃
  
  exact h_main