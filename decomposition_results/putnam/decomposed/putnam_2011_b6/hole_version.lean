macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2011_b6
(p : ℕ)
(hp : Odd p ∧ Nat.Prime p)
: {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1)/2 := by
  have h2 : p ≠ 0 := by
    have h2 := hp.2.pos
    hole_2

  have h3 : p ≠ 1 := by
    have h3 := Nat.Prime.ne_one hp.2
    hole_3

  have h4 : (p : ℕ) % 2 = 1 := by
    hole_4

  have h5 : (p + 1) / 2 ≤ p := by
    hole_5

  have h6 : {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1) / 2 := by
    have h₀ := hp.1
    have h₁ := hp.2
    have h₂ : p ≥ 2 := Nat.Prime.two_le h₁
    
    
    
    
    
    have h₃ : (p + 1) / 2 ≤ p := by hole_7
    have h₄ : (p + 1) / 2 ≤ p := by hole_8
    
    
    
    
    
    have h₅ : {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1) / 2 := by
      
      
      
      
      
      
      
      
      
      
      
      
      have h₅₁ : ∀ n : ℕ, n ∈ (Finset.range p) → (p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)) ∨ ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ) := by
        hole_10
      
      
      
      
      
      
      
      
      
      have h₅₂ : {n ∈ Finset.range p | ¬ p ∣ ∑ k : Finset.range p, Nat.factorial k * n^(k : ℕ)}.card ≥ (p + 1) / 2 := by
        
        
        
        
        
        
        
        have h₅₃ : p = 3 := by
          have h₅₄ := hp.2.eq_two_or_odd
          have h₅₅ : p ≥ 2 := Nat.Prime.two_le h₁
          have h₅₆ : p % 2 = 1 := by hole_13
          have h₅₇ : p = 3 := by
            
            
            
            
            
            
            
            
            
            
            
            hole_14
          hole_12
        hole_11
      hole_9
    hole_6
  
  hole_1