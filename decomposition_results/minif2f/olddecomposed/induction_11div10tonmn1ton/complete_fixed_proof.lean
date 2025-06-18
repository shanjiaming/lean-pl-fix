theorem induction_11div10tonmn1ton (n : ℕ) : 11 ∣ 10 ^ n - (-1 : ℤ) ^ n := by
  have h_main : (11 : ℤ) ∣ (10 : ℤ) ^ n - (-1 : ℤ) ^ n := by
    have h₁ : (10 : ℤ) ≡ (-1 : ℤ) [ZMOD 11] := by
      
      admit
    
    have h₂ : (10 : ℤ) ^ n ≡ (-1 : ℤ) ^ n [ZMOD 11] := by
      
      admit
    
    have h₃ : (11 : ℤ) ∣ (10 : ℤ) ^ n - (-1 : ℤ) ^ n := by
      
      admit
    
    admit
  
  have h_final : 11 ∣ 10 ^ n - (-1 : ℤ) ^ n := by
    admit
  
  admit