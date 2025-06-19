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

theorem putnam_1991_b5
(p : ℕ)
(podd : Odd p)
(pprime : Prime p)
: ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = ((fun p : ℕ => Nat.ceil ((p : ℝ) / 4)) : ℕ → ℕ ) p := by
  have h₁ : p > 2 := by
    have h₁₁ := pprime.two_le
    have h₁₂ := podd
    cases' h₁₂ with k hk
    have h₁₃ := Nat.Prime.ne_zero pprime
    have h₁₄ : p ≠ 2 := by
      by_contra h
      rw [h] at hk
      norm_num at hk
      <;> omega
    omega
  
  have h₂ : ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = Nat.ceil ((p : ℝ) / 4) := by
    have h₃ : p ≥ 3 := by hole_1
    have h₄ : p ≥ 3 := by hole_2
    
    
    have h₅ : ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = Nat.ceil ((p : ℝ) / 4) := by
      
      have h₆ : ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = Nat.ceil ((p : ℝ) / 4) := by
        
        have h₇ : p > 0 := by hole_3
        have h₈ : p > 0 := by hole_4
        
        
        have h₉ : ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = Nat.ceil ((p : ℝ) / 4) := by
          
          have h₁₀ : p > 0 := by hole_5
          have h₁₁ : p > 0 := by hole_6
          
          
          have h₁₂ : ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = Nat.ceil ((p : ℝ) / 4) := by
            
            hole_7
          hole_8
        hole_9
      hole_10
    hole_11
  
  hole_12