macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)

theorem numbertheory_aoddbdiv4asqpbsqmod8eq1 (a : ℤ) (b : ℕ) (h₀ : Odd a) (h₁ : 4 ∣ b) :
    (a ^ 2 + b ^ 2) % 8 = 1 := by
  have h₂ : (a ^ 2 : ℤ) % 8 = 1 := by
    have h₂₁ : a % 8 = 1 ∨ a % 8 = 3 ∨ a % 8 = 5 ∨ a % 8 = 7 := by
      cases' h₀ with k hk
      have : a % 8 = (2 * k + 1) % 8 := by hole_1
      have h₂₂ : (2 * k + 1 : ℤ) % 8 = 1 ∨ (2 * k + 1 : ℤ) % 8 = 3 ∨ (2 * k + 1 : ℤ) % 8 = 5 ∨ (2 * k + 1 : ℤ) % 8 = 7 := by
        have : (k : ℤ) % 8 = 0 ∨ (k : ℤ) % 8 = 1 ∨ (k : ℤ) % 8 = 2 ∨ (k : ℤ) % 8 = 3 ∨ (k : ℤ) % 8 = 4 ∨ (k : ℤ) % 8 = 5 ∨ (k : ℤ) % 8 = 6 ∨ (k : ℤ) % 8 = 7 := by
          hole_2
        hole_3
      hole_4
    hole_5
  
  have h₃ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
    have h₃₁ : (4 : ℕ) ∣ b := h₁
    have h₃₂ : (8 : ℕ) ∣ b ^ 2 := by
      have h₃₃ : (4 : ℕ) ∣ b := h₁
      have h₃₄ : (8 : ℕ) ∣ b ^ 2 := by
        obtain ⟨k, hk⟩ := h₃₃
        have h₃₅ : b = 4 * k := by hole_6
        rw [h₃₅]
        have h₃₆ : (8 : ℕ) ∣ (4 * k : ℕ) ^ 2 := by
          hole_7
        hole_8
      hole_9
    have h₃₃ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
      have h₃₄ : (8 : ℕ) ∣ b ^ 2 := h₃₂
      have h₃₅ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
        have h₃₆ : (b ^ 2 : ℕ) % 8 = 0 := by
          hole_10
        have h₃₇ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
          hole_11
        hole_12
      hole_13
    hole_14
  
  have h₄ : (a ^ 2 + (b ^ 2 : ℤ)) % 8 = 1 := by
    have h₄₁ : (a ^ 2 + (b ^ 2 : ℤ)) % 8 = ((a ^ 2 : ℤ) % 8 + ((b ^ 2 : ℕ) : ℤ) % 8) % 8 := by
      hole_15
    hole_16
  
  have h₅ : (a ^ 2 + b ^ 2) % 8 = 1 := by
    
    have h₅₁ : (a ^ 2 + b ^ 2 : ℤ) = (a ^ 2 + (b ^ 2 : ℤ)) := by
      hole_17
    hole_18
  
  hole_19