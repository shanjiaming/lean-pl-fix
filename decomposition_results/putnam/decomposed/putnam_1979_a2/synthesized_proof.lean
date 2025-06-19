theorem putnam_1979_a2
: ∀ k : ℝ, (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ ((fun k : ℝ => k ≥ 0) : ℝ → Prop ) k := by
  intro k
  have h_main : (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ k ≥ 0 := by
    constructor
    · 
      intro h
      by_contra h₁
      
      have h₂ : k < 0 := by linarith
      obtain ⟨f, hf_cont, hf⟩ := h
      
      have h₃ : Function.Injective f := by
        intro a b h₄
        have h₅ : f (f a) = f (f b) := by admit
        have h₆ : f (f a) = k * a ^ 9 := by admit
        have h₇ : f (f b) = k * b ^ 9 := by admit
        have h₈ : k * a ^ 9 = k * b ^ 9 := by linarith
        have h₉ : a ^ 9 = b ^ 9 := by
          nlinarith
        have h₁₀ : a = b := by
          
          have h₁₁ : a ^ 9 = b ^ 9 := h₉
          have h₁₂ : a ^ 2 = b ^ 2 := by
            admit
          have h₁₃ : a = b := by
            admit
          linarith
        linarith
      
      have h₄ : StrictMono f ∨ StrictAnti f := by
        have h₅ : Continuous f := hf_cont
        have h₆ : Function.Injective f := h₃
        admit
      
      cases h₄ with
      | inl h₄ =>
        
        have h₅ : StrictMono (f ∘ f) := h₄.comp h₄
        have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
          simpa
        have h₇ : f (f 1) < f (f (-1)) := by
          have h₈ : (1 : ℝ) > -1 := by norm_num
          have h₉ : f (f 1) < f (f (-1)) := by
            have h₁₀ : f (f 1) = k * (1 : ℝ) ^ 9 := by admit
            have h₁₁ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by admit
            have h₁₂ : (1 : ℝ) ^ 9 = 1 := by norm_num
            have h₁₃ : (-1 : ℝ) ^ 9 = -1 := by norm_num
            have h₁₄ : f (f 1) = k := by linarith
            have h₁₅ : f (f (-1)) = -k := by linarith
            have h₁₆ : k < -k := by
              have h₁₇ : k < 0 := h₂
              linarith
            linarith
          linarith
        have h₈ : f (f 1) < f (f (-1)) := h₇
        have h₉ : (1 : ℝ) > -1 := by norm_num
        have h₁₀ : f (f 1) < f (f (-1)) := h₈
        have h₁₁ : f (f 1) = k * (1 : ℝ) ^ 9 := by admit
        have h₁₂ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by admit
        have h₁₃ : (1 : ℝ) ^ 9 = 1 := by norm_num
        have h₁₄ : (-1 : ℝ) ^ 9 = -1 := by norm_num
        have h₁₅ : f (f 1) = k := by linarith
        have h₁₆ : f (f (-1)) = -k := by linarith
        have h₁₇ : k < -k := by
          have h₁₈ : k < 0 := h₂
          linarith
        have h₁₉ : f (f 1) < f (f (-1)) := h₈
        linarith
      | inr h₄ =>
        
        have h₅ : StrictMono (f ∘ f) := by
          intro x y hxy
          have h₆ : f x > f y := by
            admit
          have h₇ : f (f x) < f (f y) := by
            admit
          simpa
        have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
          simpa
        have h₇ : f (f 1) < f (f (-1)) := by
          have h₈ : (1 : ℝ) > -1 := by norm_num
          have h₉ : f (f 1) < f (f (-1)) := by
            have h₁₀ : f (f 1) = k * (1 : ℝ) ^ 9 := by admit
            have h₁₁ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by admit
            have h₁₂ : (1 : ℝ) ^ 9 = 1 := by norm_num
            have h₁₃ : (-1 : ℝ) ^ 9 = -1 := by norm_num
            have h₁₄ : f (f 1) = k := by linarith
            have h₁₅ : f (f (-1)) = -k := by linarith
            have h₁₆ : k < -k := by
              have h₁₇ : k < 0 := h₂
              linarith
            linarith
          linarith
        have h₈ : f (f 1) < f (f (-1)) := h₇
        have h₉ : (1 : ℝ) > -1 := by norm_num
        have h₁₀ : f (f 1) < f (f (-1)) := h₈
        have h₁₁ : f (f 1) = k * (1 : ℝ) ^ 9 := by admit
        have h₁₂ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by admit
        have h₁₃ : (1 : ℝ) ^ 9 = 1 := by norm_num
        have h₁₄ : (-1 : ℝ) ^ 9 = -1 := by norm_num
        have h₁₅ : f (f 1) = k := by linarith
        have h₁₆ : f (f (-1)) = -k := by linarith
        have h₁₇ : k < -k := by
          have h₁₈ : k < 0 := h₂
          linarith
        have h₁₉ : f (f 1) < f (f (-1)) := h₈
        linarith
    · 
      intro h
      by_cases h₁ : k = 0
      · 
        use fun x => 0
        constructor
        · 
          exact continuous_const
        · 
          intro x
          simp [h₁]
          <;> ring_nf
          <;> norm_num
      · 
        have h₂ : k > 0 := by
          positivity
        use fun x => k ^ (1 / 4 : ℝ) * x ^ 3
        constructor
        · 
          apply Continuous.mul
          · exact continuous_const
          · exact continuous_pow 3
        · 
          intro x
          have h₃ : (k ^ (1 / 4 : ℝ) * x ^ 3 : ℝ) = k ^ (1 / 4 : ℝ) * x ^ 3 := by norm_num
          rw [h₃]
          have h₄ : (k ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 : ℝ) = k * x ^ 9 := by
            have h₅ : (k : ℝ) > 0 := by linarith
            have h₆ : (k : ℝ) ^ (1 / 4 : ℝ) > 0 := Real.rpow_pos_of_pos h₅ (1 / 4)
            have h₇ : (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 = k * x ^ 9 := by
              admit
            linarith
          linarith
  
  simpa
