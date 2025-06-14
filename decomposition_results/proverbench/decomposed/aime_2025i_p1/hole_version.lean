macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

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
            have h₄₄ : b + 7 > 0 := by hole_6
            have h₄₅ : 9 * (b + 7) ≥ 9 * (b + 7) := by hole_7
            hole_5
          rw [h₄₃] at h₄₁
          
          have h₄₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
          have h₄₇ : b + 7 ∣ 9 * (b + 7) := by
            hole_8
          have h₄₈ : b + 7 ∣ 56 := by
            have h₄₉ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
            have h₅₀ : b + 7 ∣ 9 * (b + 7) := by
              hole_10
            have h₅₁ : b + 7 ∣ 56 := by
              
              have h₅₂ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
              have h₅₃ : b + 7 ∣ 9 * (b + 7) := by
                hole_12
              have h₅₄ : b + 7 ∣ 56 := by
                
                have h₅₅ : 9 * (b + 7) - 56 = 9 * (b + 7) - 56 := rfl
                have h₅₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                have h₅₇ : b + 7 ∣ 56 := by
                  
                  have h₅₈ : b + 7 ≤ 9 * (b + 7) := by hole_15
                  have h₅₉ : 9 * (b + 7) - 56 ≤ 9 * (b + 7) := by hole_16
                  have h₆₀ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                  have h₆₁ : b + 7 ∣ 56 := by
                    
                    have h₆₂ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                    have h₆₃ : b + 7 ∣ 9 * (b + 7) := by
                      hole_18
                    
                    have h₆₄ : b + 7 ∣ 56 := by
                      
                      have h₆₅ : 9 * (b + 7) - 56 = 9 * (b + 7) - 56 := rfl
                      have h₆₆ : b + 7 ∣ 9 * (b + 7) - 56 := h₄₁
                      have h₆₇ : b + 7 ∣ 56 := by
                        
                        hole_20
                      hole_19
                    hole_17
                  hole_14
                hole_13
              hole_11
            hole_9
          hole_4
        hole_3
      have h₅ : b + 7 ∣ 56 := h₄
      have h₆ : b + 7 ≤ 56 := Nat.le_of_dvd (by norm_num) h₅
      have h₇ : b ≤ 49 := by hole_21
      interval_cases b <;> norm_num at h₅ h₂ ⊢ <;> omega
    · intro h
      have h₂ : b = 21 ∨ b = 49 := by hole_22
      hole_2
  
  have h₂ : (∑ b in S, b) = 70 := by
    hole_23
  
  hole_1