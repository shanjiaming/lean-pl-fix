theorem no_positive_integers_for_expression : ¬ ∃ (k : ℤ), (a^2 + b^2 + c^2 : ℤ) = k * (3 * (a * b + b * c + c * a : ℤ)) := by
  have h_main : ∀ (a b c : ℕ), 0 < a → 0 < b → 0 < c → ¬ (∃ (k : ℤ), (a^2 + b^2 + c^2 : ℤ) = k * (3 * (a * b + b * c + c * a : ℤ))) := by
    intro a b c ha hb hc
    intro h
    
    rcases h with ⟨k, hk⟩
    
    norm_cast at hk
    
    have h₁ : a ≠ 0 := by admit
    have h₂ : b ≠ 0 := by admit
    have h₃ : c ≠ 0 := by admit
    
    have h₄ : False := by
      by_contra h₄
      
      have h₅ : k > 0 := by
        by_contra h₅
        have h₅₁ : k ≤ 0 := by admit
        have h₅₂ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 > 0 := by admit
        have h₅₃ : (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) > 0 := by admit
        have h₅₄ : k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) ≤ 0 := by
          have h₅₅ : k ≤ 0 := by admit
          have h₅₆ : (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) > 0 := by admit
          admit
        admit
      
      have h₆ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by admit
      
      have h₇ : ∃ (a' b' c' : ℕ), 0 < a' ∧ 0 < b' ∧ 0 < c' ∧ (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) ∧ (a' < a ∨ b' < b ∨ c' < c) := by
        by_cases h₇ : a % 3 = 0
        · by_cases h₈ : b % 3 = 0
          · by_cases h₉ : c % 3 = 0
            · 
              use a / 3, b / 3, c / 3
              have h₁₀ : a ≥ 3 := by
                by_contra h₁₀
                have h₁₁ : a < 3 := by admit
                have h₁₂ : a = 1 ∨ a = 2 := by admit
                admit
              have h₁₁ : b ≥ 3 := by
                by_contra h₁₁
                have h₁₂ : b < 3 := by admit
                have h₁₃ : b = 1 ∨ b = 2 := by admit
                admit
              have h₁₂ : c ≥ 3 := by
                by_contra h₁₂
                have h₁₃ : c < 3 := by admit
                have h₁₄ : c = 1 ∨ c = 2 := by admit
                admit
              have h₁₃ : 0 < a / 3 := by admit
              have h₁₄ : 0 < b / 3 := by admit
              have h₁₅ : 0 < c / 3 := by admit
              have h₁₆ : (a : ℤ) = 3 * (a / 3 : ℕ) := by
                admit
              have h₁₇ : (b : ℤ) = 3 * (b / 3 : ℕ) := by
                admit
              have h₁₈ : (c : ℤ) = 3 * (c / 3 : ℕ) := by
                admit
              have h₁₉ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by admit
              constructor
              · omega
              constructor
              · omega
              constructor
              · omega
              constructor
              · 
                have h₂₀ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = 9 * ((a / 3 : ℕ) ^ 2 + (b / 3 : ℕ) ^ 2 + (c / 3 : ℕ) ^ 2 : ℤ) := by
                have h₂₀₁ : (a : ℤ) = 3 * (a / 3 : ℕ) := by omega
                  have h₂₀₂ : (b : ℤ) = 3 * (b / 3 : ℕ) := by omega
                  have h₂₀₃ : (c : ℤ) = 3 * (c / 3 : ℕ) := by omega
                  rw [h₂₀₁, h₂₀₂, h₂₀₃]
                  <;> norm_cast
                  <;> ring_nf
                  <;> norm_num
                  <;> omega
                have h₂₁ : (a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a = 9 * ((a / 3 : ℕ) * (b / 3 : ℕ) + (b / 3 : ℕ) * (c / 3 : ℕ) + (c / 3 : ℕ) * (a / 3 : ℕ) : ℤ) := by
                  have h₂₁₁ : (a : ℤ) = 3 * (a / 3 : ℕ) := by omega
                  have h₂₁₂ : (b : ℤ) = 3 * (b / 3 : ℕ) := by omega
                  have h₂₁₃ : (c : ℤ) = 3 * (c / 3 : ℕ) := by omega
                  rw [h₂₁₁, h₂₁₂, h₂₁₃]
                  <;> norm_cast
                  <;> ring_nf
                  <;> norm_num
                  <;> omega
                rw [h₂₀, h₂₁] at h₆
                ring_nf at h₆ ⊢
                <;> norm_cast at h₆ ⊢
                <;> ring_nf at h₆ ⊢
                <;> norm_num at h₆ ⊢
                <;> omega
              · omega
            · 
              exfalso
              have h₁₀ : c % 3 = 1 ∨ c % 3 = 2 := by omega
              have h₁₁ : a % 3 = 0 := by omega
              have h₁₂ : b % 3 = 0 := by omega
              have h₁₃ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by linarith
              have h₁₄ : (a : ℤ) ^ 2 % 3 = 0 := by
                have h₁₄₁ : (a : ℤ) % 3 = 0 := by omega
                have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 0 := by
                  norm_num [pow_two, Int.mul_emod, h₁₄₁]
                exact h₁₄₂
              have h₁₅ : (b : ℤ) ^ 2 % 3 = 0 := by
                have h₁₅₁ : (b : ℤ) % 3 = 0 := by omega
                have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 0 := by
                  norm_num [pow_two, Int.mul_emod, h₁₅₁]
                exact h₁₅₂
              have h₁₆ : (c : ℤ) ^ 2 % 3 = 1 := by
                have h₁₆₁ : (c : ℤ) % 3 = 1 ∨ (c : ℤ) % 3 = 2 := by omega
                rcases h₁₆₁ with (h₁₆₁ | h₁₆₁)
                · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₆₁]
                  exact h₁₆₂
                · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₆₁]
                  exact h₁₆₂
              have h₁₇ : ((a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2) % 3 = 1 := by
                omega
              have h₁₈ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                have h₁₈₁ : (3 : ℤ) % 3 = 0 := by norm_num
                have h₁₈₂ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                  norm_num [Int.mul_emod, h₁₈₁]
                  <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega)
                exact h₁₈₂
              omega
          · 
            exfalso
            have h₁₀ : b % 3 = 1 ∨ b % 3 = 2 := by omega
            have h₁₁ : a % 3 = 0 := by omega
            have h₁₂ : c % 3 = 1 ∨ c % 3 = 2 := by
              by_cases h₁₂ : c % 3 = 0
              · exfalso
                have h₁₃ : c % 3 = 0 := by omega
                omega
              · have h₁₃ : c % 3 = 1 ∨ c % 3 = 2 := by omega
                exact h₁₃
            have h₁₃ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by linarith
            have h₁₄ : (a : ℤ) ^ 2 % 3 = 0 := by
              have h₁₄₁ : (a : ℤ) % 3 = 0 := by omega
              have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 0 := by
                norm_num [pow_two, Int.mul_emod, h₁₄₁]
              exact h₁₄₂
            have h₁₅ : (b : ℤ) ^ 2 % 3 = 1 := by
              have h₁₅₁ : (b : ℤ) % 3 = 1 ∨ (b : ℤ) % 3 = 2 := by omega
              rcases h₁₅₁ with (h₁₅₁ | h₁₅₁)
              · have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 1 := by
                  norm_num [pow_two, Int.mul_emod, h₁₅₁]
                exact h₁₅₂
              · have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 1 := by
                  norm_num [pow_two, Int.mul_emod, h₁₅₁]
                exact h₁₅₂
            have h₁₆ : (c : ℤ) ^ 2 % 3 = 1 := by
              have h₁₆₁ : (c : ℤ) % 3 = 1 ∨ (c : ℤ) % 3 = 2 := by omega
              rcases h₁₆₁ with (h₁₆₁ | h₁₆₁)
              · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                  norm_num [pow_two, Int.mul_emod, h₁₆₁]
                exact h₁₆₂
              · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                  norm_num [pow_two, Int.mul_emod, h₁₆₁]
                exact h₁₆₂
            have h₁₇ : ((a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2) % 3 = 2 := by
              omega
            have h₁₈ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
              have h₁₈₁ : (3 : ℤ) % 3 = 0 := by norm_num
              have h₁₈₂ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                norm_num [Int.mul_emod, h₁₈₁]
                <;>
                (try omega) <;>
                (try ring_nf at * <;> omega)
              exact h₁₈₂
            omega
        · 
          by_cases h₈ : b % 3 = 0
          · 
            by_cases h₉ : c % 3 = 0
            · 
              exfalso
              have h₁₀ : a % 3 = 1 ∨ a % 3 = 2 := by omega
              have h₁₁ : b % 3 = 0 := by omega
              have h₁₂ : c % 3 = 0 := by omega
              have h₁₃ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by linarith
              have h₁₄ : (a : ℤ) ^ 2 % 3 = 1 := by
                have h₁₄₁ : (a : ℤ) % 3 = 1 ∨ (a : ℤ) % 3 = 2 := by omega
                rcases h₁₄₁ with (h₁₄₁ | h₁₄₁)
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
              have h₁₅ : (b : ℤ) ^ 2 % 3 = 0 := by
                have h₁₅₁ : (b : ℤ) % 3 = 0 := by omega
                have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 0 := by
                  norm_num [pow_two, Int.mul_emod, h₁₅₁]
                exact h₁₅₂
              have h₁₆ : (c : ℤ) ^ 2 % 3 = 0 := by
                have h₁₆₁ : (c : ℤ) % 3 = 0 := by omega
                have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 0 := by
                  norm_num [pow_two, Int.mul_emod, h₁₆₁]
                exact h₁₆₂
              have h₁₇ : ((a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2) % 3 = 1 := by
                omega
              have h₁₈ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                have h₁₈₁ : (3 : ℤ) % 3 = 0 := by norm_num
                have h₁₈₂ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                  norm_num [Int.mul_emod, h₁₈₁]
                  <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega)
                exact h₁₈₂
              omega
            · 
              exfalso
              have h₁₀ : c % 3 = 1 ∨ c % 3 = 2 := by omega
              have h₁₁ : b % 3 = 0 := by omega
              have h₁₂ : a % 3 = 1 ∨ a % 3 = 2 := by omega
              have h₁₃ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by linarith
              have h₁₄ : (a : ℤ) ^ 2 % 3 = 1 := by
                have h₁₄₁ : (a : ℤ) % 3 = 1 ∨ (a : ℤ) % 3 = 2 := by omega
                rcases h₁₄₁ with (h₁₄₁ | h₁₄₁)
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
              have h₁₅ : (b : ℤ) ^ 2 % 3 = 0 := by
                have h₁₅₁ : (b : ℤ) % 3 = 0 := by omega
                have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 0 := by
                  norm_num [pow_two, Int.mul_emod, h₁₅₁]
                exact h₁₅₂
              have h₁₆ : (c : ℤ) ^ 2 % 3 = 1 := by
                have h₁₆₁ : (c : ℤ) % 3 = 1 ∨ (c : ℤ) % 3 = 2 := by omega
                rcases h₁₆₁ with (h₁₆₁ | h₁₆₁)
                · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₆₁]
                  exact h₁₆₂
                · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₆₁]
                  exact h₁₆₂
              have h₁₇ : ((a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2) % 3 = 2 := by
                omega
              have h₁₈ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                have h₁₈₁ : (3 : ℤ) % 3 = 0 := by norm_num
                have h₁₈₂ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                  norm_num [Int.mul_emod, h₁₈₁]
                  <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega)
                exact h₁₈₂
              omega
          · 
            by_cases h₉ : c % 3 = 0
            · 
              exfalso
              have h₁₀ : b % 3 = 1 ∨ b % 3 = 2 := by omega
              have h₁₁ : c % 3 = 0 := by omega
              have h₁₂ : a % 3 = 1 ∨ a % 3 = 2 := by omega
              have h₁₃ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by linarith
              have h₁₄ : (a : ℤ) ^ 2 % 3 = 1 := by
                have h₁₄₁ : (a : ℤ) % 3 = 1 ∨ (a : ℤ) % 3 = 2 := by omega
                rcases h₁₄₁ with (h₁₄₁ | h₁₄₁)
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
              have h₁₅ : (b : ℤ) ^ 2 % 3 = 1 := by
                have h₁₅₁ : (b : ℤ) % 3 = 1 ∨ (b : ℤ) % 3 = 2 := by omega
                rcases h₁₅₁ with (h₁₅₁ | h₁₅₁)
                · have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₅₁]
                  exact h₁₅₂
                · have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₅₁]
                  exact h₁₅₂
              have h₁₆ : (c : ℤ) ^ 2 % 3 = 0 := by
                have h₁₆₁ : (c : ℤ) % 3 = 0 := by omega
                have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 0 := by
                  norm_num [pow_two, Int.mul_emod, h₁₆₁]
                exact h₁₆₂
              have h₁₇ : ((a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2) % 3 = 2 := by
                omega
              have h₁₈ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                have h₁₈₁ : (3 : ℤ) % 3 = 0 := by norm_num
                have h₁₈₂ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                  norm_num [Int.mul_emod, h₁₈₁]
                  <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega)
                exact h₁₈₂
              omega
            · 
              exfalso
              have h₁₀ : a % 3 = 1 ∨ a % 3 = 2 := by omega
              have h₁₁ : b % 3 = 1 ∨ b % 3 = 2 := by omega
              have h₁₂ : c % 3 = 1 ∨ c % 3 = 2 := by omega
              have h₁₃ : (a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2 = k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) := by linarith
              have h₁₄ : (a : ℤ) ^ 2 % 3 = 1 := by
                have h₁₄₁ : (a : ℤ) % 3 = 1 ∨ (a : ℤ) % 3 = 2 := by omega
                rcases h₁₄₁ with (h₁₄₁ | h₁₄₁)
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
                · have h₁₄₂ : (a : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₄₁]
                  exact h₁₄₂
              have h₁₅ : (b : ℤ) ^ 2 % 3 = 1 := by
                have h₁₅₁ : (b : ℤ) % 3 = 1 ∨ (b : ℤ) % 3 = 2 := by omega
                rcases h₁₅₁ with (h₁₅₁ | h₁₅₁)
                · have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₅₁]
                  exact h₁₅₂
                · have h₁₅₂ : (b : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₅₁]
                  exact h₁₅₂
              have h₁₆ : (c : ℤ) ^ 2 % 3 = 1 := by
                have h₁₆₁ : (c : ℤ) % 3 = 1 ∨ (c : ℤ) % 3 = 2 := by omega
                rcases h₁₆₁ with (h₁₆₁ | h₁₆₁)
                · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₆₁]
                  exact h₁₆₂
                · have h₁₆₂ : (c : ℤ) ^ 2 % 3 = 1 := by
                    norm_num [pow_two, Int.mul_emod, h₁₆₁]
                  exact h₁₆₂
              have h₁₇ : ((a : ℤ) ^ 2 + (b : ℤ) ^ 2 + (c : ℤ) ^ 2) % 3 = 0 := by
                omega
              have h₁₈ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                have h₁₈₁ : (3 : ℤ) % 3 = 0 := by norm_num
                have h₁₈₂ : (k * (3 : ℤ) * ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ)) % 3 = 0 := by
                  norm_num [Int.mul_emod, h₁₈₁]
                  <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega)
                exact h₁₈₂
              have h₁₉ : ((a : ℤ) * b + (b : ℤ) * c + (c : ℤ) * a : ℤ) % 3 = 0 := by
                
                have h₁₉₁ : (a : ℤ) % 3 = 1 ∨ (a : ℤ) % 3 = 2 := by omega
                have h₁₉₂ : (b : ℤ) % 3 = 1 ∨ (b : ℤ) % 3 = 2 := by omega
                have h₁₉₃ : (c : ℤ) % 3 = 1 ∨ (c : ℤ) % 3 = 2 := by omega
                rcases h₁₉₁ with (h₁₉₁ | h₁₉₁) <;> rcases h₁₉₂ with (h₁₉₂ | h₁₉₂) <;> rcases h₁₉₃ with (h₁₉₃ | h₁₉₃) <;>
                  simp [h₁₉₁, h₁₉₂, h₁₉₃, Int.mul_emod, Int.add_emod, pow_two] at h₁₇ h₁₈ ⊢ <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega) <;>
                  (try norm_num) <;>
                  (try omega)
              have h₂₀ : False := by
                have h₂₀₁ : (a : ℤ) % 3 = 1 ∨ (a : ℤ) % 3 = 2 := by omega
                have h₂₀₂ : (b : ℤ) % 3 = 1 ∨ (b : ℤ) % 3 = 2 := by omega
                have h₂₀₃ : (c : ℤ) % 3 = 1 ∨ (c : ℤ) % 3 = 2 := by omega
                rcases h₂₀₁ with (h₂₀₁ | h₂₀₁) <;> rcases h₂₀₂ with (h₂₀₂ | h₂₀₂) <;> rcases h₂₀₃ with (h₂₀₃ | h₂₀₃) <;>
                  simp [h₂₀₁, h₂₀₂, h₂₀₃, Int.mul_emod, Int.add_emod, pow_two] at h₁₇ h₁₈ h₁₉ ⊢ <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega) <;>
                  (try norm_num) <;>
                  (try omega)
              exact h₂₀
      exact h₄
    exact h₄
  have h_final : ¬ (∃ (k : ℤ), (a^2 + b^2 + c^2 : ℤ) = k * (3 * (a * b + b * c + c * a : ℤ))) := by
    have h₁ := h_main a b c ha hb hc
    exact h₁
  exact h_final