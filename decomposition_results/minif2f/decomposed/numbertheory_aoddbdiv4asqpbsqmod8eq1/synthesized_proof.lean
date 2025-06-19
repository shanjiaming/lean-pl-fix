theorem numbertheory_aoddbdiv4asqpbsqmod8eq1 (a : ℤ) (b : ℕ) (h₀ : Odd a) (h₁ : 4 ∣ b) :
    (a ^ 2 + b ^ 2) % 8 = 1 := by
  have h₂ : (a ^ 2 : ℤ) % 8 = 1 := by
    have h₂₁ : a % 8 = 1 ∨ a % 8 = 3 ∨ a % 8 = 5 ∨ a % 8 = 7 := by
      cases' h₀ with k hk
      have : a % 8 = (2 * k + 1) % 8 := by omega
      have h₂₂ : (2 * k + 1 : ℤ) % 8 = 1 ∨ (2 * k + 1 : ℤ) % 8 = 3 ∨ (2 * k + 1 : ℤ) % 8 = 5 ∨ (2 * k + 1 : ℤ) % 8 = 7 := by
        have : (k : ℤ) % 8 = 0 ∨ (k : ℤ) % 8 = 1 ∨ (k : ℤ) % 8 = 2 ∨ (k : ℤ) % 8 = 3 ∨ (k : ℤ) % 8 = 4 ∨ (k : ℤ) % 8 = 5 ∨ (k : ℤ) % 8 = 6 ∨ (k : ℤ) % 8 = 7 := by
          omega
        omega
      omega
    admit
  
  have h₃ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
    have h₃₁ : (4 : ℕ) ∣ b := h₁
    have h₃₂ : (8 : ℕ) ∣ b ^ 2 := by
      have h₃₃ : (4 : ℕ) ∣ b := h₁
      have h₃₄ : (8 : ℕ) ∣ b ^ 2 := by
        obtain ⟨k, hk⟩ := h₃₃
        have h₃₅ : b = 4 * k := by linarith
        rw [h₃₅]
        have h₃₆ : (8 : ℕ) ∣ (4 * k : ℕ) ^ 2 := by
          admit
        omega
      omega
    have h₃₃ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
      have h₃₄ : (8 : ℕ) ∣ b ^ 2 := h₃₂
      have h₃₅ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
        have h₃₆ : (b ^ 2 : ℕ) % 8 = 0 := by
          omega
        have h₃₇ : ((b ^ 2 : ℕ) : ℤ) % 8 = 0 := by
          omega
        linarith
      linarith
    linarith
  
  have h₄ : (a ^ 2 + (b ^ 2 : ℤ)) % 8 = 1 := by
    have h₄₁ : (a ^ 2 + (b ^ 2 : ℤ)) % 8 = ((a ^ 2 : ℤ) % 8 + ((b ^ 2 : ℕ) : ℤ) % 8) % 8 := by
      norm_num
    omega
  
  have h₅ : (a ^ 2 + b ^ 2) % 8 = 1 := by
    
    have h₅₁ : (a ^ 2 + b ^ 2 : ℤ) = (a ^ 2 + (b ^ 2 : ℤ)) := by
      norm_num
    linarith
  
  linarith
