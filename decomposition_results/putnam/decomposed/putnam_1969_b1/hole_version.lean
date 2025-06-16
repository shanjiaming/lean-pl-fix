macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_79" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_1969_b1
(n : ℕ)
(hnpos : n > 0)
(hn : 24 ∣ n + 1)
: 24 ∣ ∑ d in divisors n, d := by
  have h₀ : n % 2 = 1 := by
    have h₁ : (n + 1) % 2 = 0 := by hole_3
    hole_2
  
  have h₁ : n % 8 = 7 := by
    have h₂ : (n + 1) % 24 = 0 := by hole_5
    hole_4
  
  have h₂ : n % 3 = 2 := by
    have h₃ : (n + 1) % 24 = 0 := by hole_7
    hole_6
  
  have h₃ : ¬ IsSquare n := by
    intro h
    rcases h with ⟨k, rfl⟩
    have h₄ : k ^ 2 % 8 = 0 ∨ k ^ 2 % 8 = 1 ∨ k ^ 2 % 8 = 4 := by
      have : k % 8 = 0 ∨ k % 8 = 1 ∨ k % 8 = 2 ∨ k % 8 = 3 ∨ k % 8 = 4 ∨ k % 8 = 5 ∨ k % 8 = 6 ∨ k % 8 = 7 := by hole_10
      hole_9
    have h₅ : k ^ 2 % 8 = 0 ∨ k ^ 2 % 8 = 1 ∨ k ^ 2 % 8 = 4 := by hole_11
    have h₆ : (k ^ 2) % 8 = 7 → False := by
      hole_12
    have h₇ : (k ^ 2) % 8 = 7 → False := by hole_13
    have h₈ : (k ^ 2) % 8 ≠ 7 := by
      hole_14
    hole_8
  
  have h₄ : ∀ (d : ℕ), d ∣ n → (d + n / d) % 8 = 0 := by
    intro d hd
    have h₅ : d ∣ n := hd
    have h₆ : d % 2 = 1 := by
      by_contra h
      have h₇ : d % 2 = 0 := by hole_17
      have h₈ : 2 ∣ d := by
        hole_18
      have h₉ : 2 ∣ n := by
        hole_19
      have h₁₀ : n % 2 = 0 := by
        hole_20
      hole_16
    have h₇ : d * (n / d) = n := by
      have h₈ : d * (n / d) = n := Nat.mul_div_cancel' h₅
      hole_21
    have h₈ : (d * (n / d)) % 8 = 7 := by
      hole_22
    have h₉ : (d % 8 = 1 ∧ (n / d) % 8 = 7) ∨ (d % 8 = 7 ∧ (n / d) % 8 = 1) ∨ (d % 8 = 3 ∧ (n / d) % 8 = 5) ∨ (d % 8 = 5 ∧ (n / d) % 8 = 3) := by
      have h₁₀ : d % 8 = 1 ∨ d % 8 = 3 ∨ d % 8 = 5 ∨ d % 8 = 7 := by hole_24
      rcases h₁₀ with (h₁₀ | h₁₀ | h₁₀ | h₁₀)
      · 
        have h₁₁ : (n / d) % 8 = 7 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          hole_25
        exact Or.inl ⟨h₁₀, h₁₁⟩
      · 
        have h₁₁ : (n / d) % 8 = 5 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          hole_26
        exact Or.inr (Or.inr (Or.inl ⟨h₁₀, h₁₁⟩))
      · 
        have h₁₁ : (n / d) % 8 = 3 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          hole_27
        exact Or.inr (Or.inr (Or.inr ⟨h₁₀, h₁₁⟩))
      · 
        have h₁₁ : (n / d) % 8 = 1 := by
          have h₁₂ : (d * (n / d)) % 8 = 7 := h₈
          hole_28
        hole_23
    rcases h₉ with (⟨h₉₁, h₉₂⟩ | ⟨h₉₁, h₉₂⟩ | ⟨h₉₁, h₉₂⟩ | ⟨h₉₁, h₉₂⟩)
    · 
      have h₁₀ : (d + n / d) % 8 = 0 := by
        hole_29
      exact h₁₀
    · 
      have h₁₀ : (d + n / d) % 8 = 0 := by
        hole_30
      exact h₁₀
    · 
      have h₁₀ : (d + n / d) % 8 = 0 := by
        hole_31
      exact h₁₀
    · 
      have h₁₀ : (d + n / d) % 8 = 0 := by
        hole_32
      hole_15
  
  have h₅ : ∀ (d : ℕ), d ∣ n → (d + n / d) % 3 = 0 := by
    intro d hd
    have h₅ : d ∣ n := hd
    have h₆ : d * (n / d) = n := Nat.mul_div_cancel' h₅
    have h₇ : (d * (n / d)) % 3 = 2 := by
      hole_34
    have h₈ : d % 3 ≠ 0 := by
      by_contra h
      have h₉ : d % 3 = 0 := by hole_36
      have h₁₀ : 3 ∣ d := by
        hole_37
      have h₁₁ : 3 ∣ n := by
        hole_38
      have h₁₂ : n % 3 = 0 := by
        hole_39
      hole_35
    have h₉ : (d + n / d) % 3 = 0 := by
      have h₁₀ : d % 3 = 1 ∨ d % 3 = 2 := by
        hole_41
      rcases h₁₀ with (h₁₀ | h₁₀)
      · 
        have h₁₁ : (n / d) % 3 = 2 := by
          have h₁₂ : (d * (n / d)) % 3 = 2 := by
            hole_43
          have h₁₃ : (d % 3) * ((n / d) % 3) % 3 = 2 := by
            hole_44
          hole_42
        have h₁₂ : (d + n / d) % 3 = 0 := by
          hole_45
        exact h₁₂
      · 
        have h₁₁ : (n / d) % 3 = 1 := by
          have h₁₂ : (d * (n / d)) % 3 = 2 := by
            hole_47
          have h₁₃ : (d % 3) * ((n / d) % 3) % 3 = 2 := by
            hole_48
          hole_46
        have h₁₂ : (d + n / d) % 3 = 0 := by
          hole_49
        hole_40
    hole_33
  
  have h₆ : ∀ (d : ℕ), d ∣ n → (d + n / d) % 24 = 0 := by
    intro d hd
    have h₆ : (d + n / d) % 8 = 0 := h₄ d hd
    have h₇ : (d + n / d) % 3 = 0 := h₅ d hd
    have h₈ : (d + n / d) % 24 = 0 := by
      have h₉ : (d + n / d) % 8 = 0 := h₆
      have h₁₀ : (d + n / d) % 3 = 0 := h₇
      hole_51
    hole_50
  
  have h₇ : 24 ∣ ∑ d in divisors n, d := by
    have h₇₁ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := by
      have h₇₂ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := by
        have h₇₃ : ∀ d ∈ divisors n, (d + n / d) % 24 = 0 := by
          intro d hd
          have h₇₄ : d ∣ n := by
            hole_56
          hole_55
        have h₇₅ : (∑ d in divisors n, (d + n / d)) % 24 = 0 := by
          
          have h₇₆ : (∑ d in divisors n, (d + n / d)) % 24 = (∑ d in divisors n, (d + n / d) % 24) % 24 := by
            hole_58
          rw [h₇₆]
          have h₇₇ : (∑ d in divisors n, (d + n / d) % 24) % 24 = 0 := by
            have h₇₈ : ∀ d ∈ divisors n, (d + n / d) % 24 = 0 := h₇₃
            hole_59
          hole_57
        hole_54
      hole_53
    have h₇₂ : 24 ∣ ∑ d in divisors n, d := by
      have h₇₃ : (∑ d in divisors n, (d + n / d)) = 2 * ∑ d in divisors n, d := by
        have h₇₄ : ∑ d in divisors n, (d + n / d) = ∑ d in divisors n, d + ∑ d in divisors n, (n / d) := by
          hole_62
        rw [h₇₄]
        have h₇₅ : ∑ d in divisors n, (n / d) = ∑ d in divisors n, d := by
          
          have h₇₆ : ∑ d in divisors n, (n / d) = ∑ d in divisors n, d := by
            apply Finset.sum_bij (fun d _ => n / d)
            · 
              intro d hd
              have h₇₇ : d ∣ n := by
                hole_65
              have h₇₈ : n / d ∣ n := by
                hole_66
              have h₇₉ : n / d ∈ divisors n := by
                hole_67
              exact h₇₉
            · 
              intro d₁ d₂ _ _ h
              have h₈₀ : n / d₁ = n / d₂ := h
              have h₈₁ : d₁ ∣ n := by
                exact dvd_of_mem_divisors ‹_›
              have h₈₂ : d₂ ∣ n := by
                exact dvd_of_mem_divisors ‹_›
              have h₈₃ : d₁ = d₂ := by
                have h₈₄ : n / d₁ = n / d₂ := h₈₀
                have h₈₅ : d₁ = d₂ := by
                  by_contra h₈₅
                  have h₈₆ : d₁ ≠ d₂ := h₈₅
                  have h₈₇ : d₁ ∣ n := h₈₁
                  have h₈₈ : d₂ ∣ n := h₈₂
                  have h₈₉ : n / d₁ = n / d₂ := h₈₄
                  have h₉₀ : d₁ ≠ d₂ := h₈₆
                  have h₉₁ : d₁ < d₂ ∨ d₂ < d₁ := by
                    cases' lt_or_gt_of_ne h₉₀ with h₉₁ h₉₁
                    · exact Or.inl h₉₁
                    · exact Or.inr h₉₁
                  cases' h₉₁ with h₉₁ h₉₁
                  · 
                    have h₉₂ : n / d₁ ≥ n / d₂ := by
                      apply Nat.div_le_div_left
                      · exact Nat.le_of_dvd (by omega) h₈₁
                      · omega
                    have h₉₃ : n / d₁ > n / d₂ := by
                      have h₉₄ : d₂ ∣ n := h₈₂
                      have h₉₅ : d₁ < d₂ := h₉₁
                      have h₉₆ : n / d₁ > n / d₂ := by
                        apply Nat.div_lt_of_lt_mul
                        have h₉₇ : d₁ < d₂ := h₉₅
                        have h₉₈ : d₁ * (n / d₁) ≤ n := by
                          apply Nat.div_mul_le_self
                        have h₉₉ : d₂ * (n / d₂) ≤ n := by
                          apply Nat.div_mul_le_self
                        nlinarith
                      exact h₉₆
                    omega
                  · 
                    have h₉₂ : n / d₂ ≥ n / d₁ := by
                      apply Nat.div_le_div_left
                      · exact Nat.le_of_dvd (by omega) h₈₂
                      · omega
                    have h₉₃ : n / d₂ > n / d₁ := by
                      have h₉₄ : d₁ ∣ n := h₈₁
                      have h₉₅ : d₂ < d₁ := h₉₁
                      have h₉₆ : n / d₂ > n / d₁ := by
                        apply Nat.div_lt_of_lt_mul
                        have h₉₇ : d₂ < d₁ := h₉₅
                        have h₉₈ : d₁ * (n / d₁) ≤ n := by
                          apply Nat.div_mul_le_self
                        have h₉₉ : d₂ * (n / d₂) ≤ n := by
                          apply Nat.div_mul_le_self
                        nlinarith
                      exact h₉₆
                    omega
                exact h₈₅
              exact h₈₃
            · 
              intro d hd
              have h₈₀ : d ∣ n := by
                hole_68
              have h₈₁ : n / d ∣ n := by
                hole_69
              have h₈₂ : n / d ∈ divisors n := by
                hole_70
              hole_64
        hole_77
      have h₇₆ : 24 ∣ 2 * ∑ d in divisors n, d := by
        hole_78
      have h₇₇ : 24 ∣ ∑ d in divisors n, d := by
        hole_79
      hole_60
    hole_52
  
  hole_1