macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem prime_congruent_1_mod_6_has_quadratic_form (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) :
  ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
  have h_main : p > 0 := by
    have h₁ : p ≥ 2 := by
      
      have h₂ := hp.two_le
      norm_cast at h₂ ⊢
      <;> omega
    
    have h₂ : p > 0 := by hole_3
    hole_2
  
  have h_nat_prime : Nat.Prime (Int.natAbs p) := by
    have h₁ : (p : ℤ) > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := by
      
      have h₃ : Int.Prime p := by
        
        have h₃ : Prime p := hp
        hole_6
      
      hole_5
    hole_4
  
  have h_p_eq_natAbs : p = (Int.natAbs p : ℤ) := by
    have h₁ : p > 0 := h_main
    have h₂ : p = (Int.natAbs p : ℤ) := by
      hole_8
    hole_7
  
  have h_exists_rep : ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
    have h₁ : p > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := h_nat_prime
    have h₃ : p = (Int.natAbs p : ℤ) := h_p_eq_natAbs
    
    have h₄ : ∃ (a b : ℤ), p = a^2 - a * b + b^2 := by
      
      have h₅ : (p : ℤ) > 0 := by hole_11
      have h₆ : (p : ℤ) % 6 = 1 := by hole_12
      have h₇ : (p : ℕ) % 6 = 1 := by
        hole_13
      have h₈ : ∃ (a b : ℤ), (p : ℤ) = a^2 - a * b + b^2 := by
        
        have h₉ : ∃ (x y : ℤ), (p : ℤ) = x^2 + 3 * y^2 := by
          
          have h₁₀ : (p : ℕ) % 6 = 1 := by hole_16
          
          have h₁₁ : ∃ (x y : ℤ), (p : ℤ) = x^2 + 3 * y^2 := by
            
            hole_17
          hole_15
        
        obtain ⟨x, y, h₉⟩ := h₉
        use (x + y), (2 * y)
        have h₁₀ : (p : ℤ) = x ^ 2 + 3 * y ^ 2 := by
          hole_18
        hole_14
      
      hole_10
    
    hole_9
  
  hole_1