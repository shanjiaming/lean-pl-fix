theorem prime_congruent_1_mod_6_has_quadratic_form (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) :
  ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
  have h_main : p > 0 := by
    have h₁ : p ≥ 2 := by
      
      have h₂ := hp.two_le
      norm_cast at h₂ ⊢
      <;> omega
    
    have h₂ : p > 0 := by admit
    admit
  
  have h_nat_prime : Nat.Prime (Int.natAbs p) := by
    have h₁ : (p : ℤ) > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := by
      
      have h₃ : Int.Prime p := by
        
        have h₃ : Prime p := hp
        admit
      
      admit
    admit
  
  have h_p_eq_natAbs : p = (Int.natAbs p : ℤ) := by
    have h₁ : p > 0 := h_main
    have h₂ : p = (Int.natAbs p : ℤ) := by
      admit
    admit
  
  have h_exists_rep : ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
    have h₁ : p > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := h_nat_prime
    have h₃ : p = (Int.natAbs p : ℤ) := h_p_eq_natAbs
    
    have h₄ : ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
      
      have h₅ : (p : ℤ) > 0 := by admit
      have h₆ : (p : ℤ) % 6 = 1 := by admit
      have h₇ : (p : ℕ) % 6 = 1 := by
        admit
      have h₈ : ∃ (a b : ℤ), (p : ℤ) = a^2 - a * b + b^2 := by
        
        have h₉ : ∃ (x y : ℤ), (p : ℤ) = x^2 + 3 * y^2 := by
          
          have h₁₀ : (p : ℕ) % 6 = 1 := by admit
          
          have h₁₁ : ∃ (x y : ℤ), (p : ℤ) = x^2 + 3 * y^2 := by
            
            admit
          admit
        
        obtain ⟨x, y, h₉⟩ := h₉
        use (x + y), (2 * y)
        have h₁₀ : (p : ℤ) = x ^ 2 + 3 * y ^ 2 := by
          admit
        admit
      
      admit
    
    admit
  
  admit