macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1979_a2
: ∀ k : ℝ, (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ ((fun k : ℝ => k ≥ 0) : ℝ → Prop ) k := by
  intro k
  have h_main : (∃ f : ℝ → ℝ, Continuous f ∧ ∀ x : ℝ, f (f x) = k*x^9) ↔ k ≥ 0 := by
    constructor
    · 
      intro h
      by_contra h₁
      
      have h₂ : k < 0 := by hole_3
      obtain ⟨f, hf_cont, hf⟩ := h
      
      have h₃ : Function.Injective f := by
        intro a b h₄
        have h₅ : f (f a) = f (f b) := by hole_5
        have h₆ : f (f a) = k * a ^ 9 := by hole_6
        have h₇ : f (f b) = k * b ^ 9 := by hole_7
        have h₈ : k * a ^ 9 = k * b ^ 9 := by hole_8
        have h₉ : a ^ 9 = b ^ 9 := by
          hole_9
        have h₁₀ : a = b := by
          
          have h₁₁ : a ^ 9 = b ^ 9 := h₉
          have h₁₂ : a ^ 2 = b ^ 2 := by
            hole_11
          have h₁₃ : a = b := by
            hole_12
          hole_10
        hole_4
      
      have h₄ : StrictMono f ∨ StrictAnti f := by
        have h₅ : Continuous f := hf_cont
        have h₆ : Function.Injective f := h₃
        hole_13
      
      cases h₄ with
      | inl h₄ =>
        
        have h₅ : StrictMono (f ∘ f) := h₄.comp h₄
        have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
          hole_14
        have h₇ : f (f 1) < f (f (-1)) := by
          have h₈ : (1 : ℝ) > -1 := by hole_16
          have h₉ : f (f 1) < f (f (-1)) := by
            have h₁₀ : f (f 1) = k * (1 : ℝ) ^ 9 := by hole_18
            have h₁₁ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by hole_19
            have h₁₂ : (1 : ℝ) ^ 9 = 1 := by hole_20
            have h₁₃ : (-1 : ℝ) ^ 9 = -1 := by hole_21
            have h₁₄ : f (f 1) = k := by hole_22
            have h₁₅ : f (f (-1)) = -k := by hole_23
            have h₁₆ : k < -k := by
              have h₁₇ : k < 0 := h₂
              hole_24
            hole_17
          hole_15
        have h₈ : f (f 1) < f (f (-1)) := h₇
        have h₉ : (1 : ℝ) > -1 := by hole_25
        have h₁₀ : f (f 1) < f (f (-1)) := h₈
        have h₁₁ : f (f 1) = k * (1 : ℝ) ^ 9 := by hole_26
        have h₁₂ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by hole_27
        have h₁₃ : (1 : ℝ) ^ 9 = 1 := by hole_28
        have h₁₄ : (-1 : ℝ) ^ 9 = -1 := by hole_29
        have h₁₅ : f (f 1) = k := by hole_30
        have h₁₆ : f (f (-1)) = -k := by hole_31
        have h₁₇ : k < -k := by
          have h₁₈ : k < 0 := h₂
          hole_32
        have h₁₉ : f (f 1) < f (f (-1)) := h₈
        linarith
      | inr h₄ =>
        
        have h₅ : StrictMono (f ∘ f) := by
          intro x y hxy
          have h₆ : f x > f y := by
            hole_34
          have h₇ : f (f x) < f (f y) := by
            hole_35
          hole_33
        have h₆ : ∀ x y : ℝ, x < y → f (f x) < f (f y) := by
          hole_36
        have h₇ : f (f 1) < f (f (-1)) := by
          have h₈ : (1 : ℝ) > -1 := by hole_38
          have h₉ : f (f 1) < f (f (-1)) := by
            have h₁₀ : f (f 1) = k * (1 : ℝ) ^ 9 := by hole_40
            have h₁₁ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by hole_41
            have h₁₂ : (1 : ℝ) ^ 9 = 1 := by hole_42
            have h₁₃ : (-1 : ℝ) ^ 9 = -1 := by hole_43
            have h₁₄ : f (f 1) = k := by hole_44
            have h₁₅ : f (f (-1)) = -k := by hole_45
            have h₁₆ : k < -k := by
              have h₁₇ : k < 0 := h₂
              hole_46
            hole_39
          hole_37
        have h₈ : f (f 1) < f (f (-1)) := h₇
        have h₉ : (1 : ℝ) > -1 := by hole_47
        have h₁₀ : f (f 1) < f (f (-1)) := h₈
        have h₁₁ : f (f 1) = k * (1 : ℝ) ^ 9 := by hole_48
        have h₁₂ : f (f (-1)) = k * (-1 : ℝ) ^ 9 := by hole_49
        have h₁₃ : (1 : ℝ) ^ 9 = 1 := by hole_50
        have h₁₄ : (-1 : ℝ) ^ 9 = -1 := by hole_51
        have h₁₅ : f (f 1) = k := by hole_52
        have h₁₆ : f (f (-1)) = -k := by hole_53
        have h₁₇ : k < -k := by
          have h₁₈ : k < 0 := h₂
          hole_54
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
          hole_55
        use fun x => k ^ (1 / 4 : ℝ) * x ^ 3
        constructor
        · 
          apply Continuous.mul
          · exact continuous_const
          · exact continuous_pow 3
        · 
          intro x
          have h₃ : (k ^ (1 / 4 : ℝ) * x ^ 3 : ℝ) = k ^ (1 / 4 : ℝ) * x ^ 3 := by hole_56
          rw [h₃]
          have h₄ : (k ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 : ℝ) = k * x ^ 9 := by
            have h₅ : (k : ℝ) > 0 := by hole_58
            have h₆ : (k : ℝ) ^ (1 / 4 : ℝ) > 0 := Real.rpow_pos_of_pos h₅ (1 / 4)
            have h₇ : (k : ℝ) ^ (1 / 4 : ℝ) * (k ^ (1 / 4 : ℝ) * x ^ 3) ^ 3 = k * x ^ 9 := by
              hole_59
            hole_57
          hole_2
  
  hole_1