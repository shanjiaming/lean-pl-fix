macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem extension_field_zero (f : F[X]) (hf : f.degree > 0) :
∃ (E : Type*) (_ : Field E) (i : F →+* E) (α : E), eval₂ i α f = 0 := by
    have h_f_ne_zero : f ≠ 0 := by
      intro h
      have h₁ := h
      hole_2
    
    have h_f_not_unit : ¬ IsUnit f := by
      intro h
      have h₁ : f.degree ≤ 0 := by
        
        have h₂ : f ≠ 0 := h_f_ne_zero
        have h₃ : IsUnit f := h
        hole_3
      
      have h₂ : f.degree > 0 := hf
      have h₃ : f.degree ≤ 0 := h₁
      have h₄ : f.degree > 0 ∧ f.degree ≤ 0 := by
        exact ⟨h₂, h₃⟩
      have h₅ : ¬(f.degree > 0 ∧ f.degree ≤ 0) := by
        intro h
        have h₆ := h.1
        have h₇ := h.2
        have h₈ : f.degree > 0 := h₆
        have h₉ : f.degree ≤ 0 := h₇
        have h₁₀ : f.degree ≤ 0 := h₉
        have h₁₁ : f.degree > 0 := h₈
        have h₁₂ : f.degree = ⊥ ∨ ∃ n : ℕ, f.degree = n := by
          cases' f.degree with n
          · exact Or.inl rfl
          · exact Or.inr ⟨n, rfl⟩
        cases' h₁₂ with h₁₂ h₁₂
        · simp_all [WithBot.bot_lt_coe]
        · simp_all [WithBot.coe_le_coe, WithBot.coe_lt_coe]
          <;> omega
        <;> simp_all [WithBot.coe_le_coe, WithBot.coe_lt_coe]
        <;> omega
      exact h₅ h₄
    
    have h_exists_irred : ∃ (p : F[X]), Irreducible p ∧ p ∣ f := by
      have h₁ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f := by
        have h₂ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f := by
          
          have h₃ : ∃ (p : F[X]), Irreducible p ∧ p ∣ f := by
            
            have h₄ : ∃ (p : F[X]), p ∣ f ∧ Irreducible p := by
              
              have h₅ : ¬IsUnit f := h_f_not_unit
              have h₆ : f ≠ 0 := h_f_ne_zero
              hole_8
            hole_7
          hole_6
        hole_5
      hole_4
    
    hole_1