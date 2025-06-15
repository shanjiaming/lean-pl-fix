theorem aime_2025i_p1 (S : Finset ℕ)
    (h₀ : ∀ (b : ℕ), b ∈ S ↔ b > 9 ∧ b + 7 ∣ 9 * b + 7) :
    (∑ b in S, b) = 70 := by
  have h₁ : S = {21, 49} := by
    apply Finset.ext
    intro b
    simp only [Finset.mem_insert, Finset.mem_singleton, h₀]
    constructor
    · intro h
      have h₂ : b > 9 := h.1
      have h₃ : b + 7 ∣ 9 * b + 7 := h.2
      have h₄ : b + 7 ∣ 56 := by
        have h₄₁ : b + 7 ∣ 9 * b + 7 := h₃
        have h₄₂ : b + 7 ∣ 56 := by
          have h₄₃ : 9 * b + 7 = 9 * (b + 7) - 56 := by
            have h₄₄ : b + 7 > 0 := by admit
            have h₄₅ : 9 * (b + 7) ≥ 9 * (b + 7) := by admit
            admit
          rw [h₄₃] at h₄₁
          
          have h₄₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
          have h₄₇ : b + 7 ∣ 9 * (b + 7) := by
            admit
          have h₄₈ : b + 7 ∣ 56 := by
            have h₄₉ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
            have h₅₀ : b + 7 ∣ 9 * (b + 7) := by
              admit
            have h₅₁ : b + 7 ∣ 56 := by
              
              have h₅₂ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
              have h₅₃ : b + 7 ∣ 9 * (b + 7) := by
                admit
              have h₅₄ : b + 7 ∣ 56 := by
                
                have h₅₅ : 9 * (b + 7) - 56 = 9 * (b + 7) - 56 := rfl
                have h₅₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                have h₅₇ : b + 7 ∣ 56 := by
                  
                  have h₅₈ : b + 7 ≤ 9 * (b + 7) := by admit
                  have h₅₉ : 9 * (b + 7) - 56 ≤ 9 * (b + 7) := by admit
                  have h₆₀ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                  have h₆₁ : b + 7 ∣ 56 := by
                    
                    have h₆₂ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                    have h₆₃ : b + 7 ∣ 9 * (b + 7) := by
                      admit
                    
                    have h₆₄ : b + 7 ∣ 56 := by
                      
                      have h₆₅ : 9 * (b + 7) - 56 = 9 * (b + 7) - 56 := rfl
                      have h₆₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                      have h₆₇ : b + 7 ∣ 56 := by
                        
                        admit
                      admit
                    admit
                  admit
                admit
              admit
            admit
          admit
        admit
      have h₅ : b + 7 ∣ 56 := h₄
      have h₆ : b + 7 ≤ 56 := Nat.le_of_dvd (by norm_num) h₅
      have h₇ : b ≤ 49 := by admit
      interval_cases b <;> norm_num at h₅ h₂ ⊢ <;> omega
    · intro h
      have h₂ : b = 21 ∨ b = 49 := by admit
      admit
  
  have h₂ : (∑ b in S, b) = 70 := by
    admit
  
  admit