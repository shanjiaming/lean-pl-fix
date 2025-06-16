macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem putnam_2005_b1
    : ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) ≠ 0 ∧ ∀ a : ℝ, MvPolynomial.eval (fun n : Fin 2 => if (n = 0) then (Int.floor a : ℝ) else (Int.floor (2 * a))) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) = 0 := by
  have h_main : ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) ≠ 0 := by
    intro h
    have h₁ : (MvPolynomial.eval (fun n => (if n = 0 then (1 : ℝ) else 0 : Fin 2 → ℝ)) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) : ℝ) = (0 : ℝ) := by
      hole_3
    have h₂ : (MvPolynomial.eval (fun n => (if n = 0 then (1 : ℝ) else 0 : Fin 2 → ℝ)) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) : ℝ) ≠ (0 : ℝ) := by
      hole_4
    hole_2
  
  have h_eval_zero : ∀ (a : ℝ), MvPolynomial.eval (fun n : Fin 2 => if (n = 0) then (Int.floor a : ℝ) else (Int.floor (2 * a))) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) = 0 := by
    intro a
    have h₁ : MvPolynomial.eval (fun n : Fin 2 => if n = 0 then (Int.floor a : ℝ) else (Int.floor (2 * a))) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ) = (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a)) * (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a) - 1) := by
      hole_6
    rw [h₁]
    have h₂ : (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a)) * (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a) - 1) = 0 := by
      
      have h₃ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = (⌊2 * a⌋ - 2 * ⌊a⌋ : ℝ) := by hole_8
      have h₄ : (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 0 ∨ (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 1 := by
        have h₅ : (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
          
          have h₅₁ : (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
            have h₅₂ : a - 1 < ⌊a⌋ := by
              hole_12
            have h₅₃ : (⌊a⌋ : ℝ) ≤ a := by hole_13
            have h₅₄ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by hole_14
            have h₅₅ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by hole_15
            have h₅₆ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by
              have h₅₇ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by hole_17
              have h₅₈ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by hole_18
              have h₅₉ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by
                
                have h₅₁₀ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by hole_20
                have h₅₁₁ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by hole_21
                have h₅₁₂ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by
                  have h₅₁₃ : (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
                    
                    have h₅₁₄ : (⌊(2 : ℝ) * a⌋ : ℤ) ≥ 2 * ⌊a⌋ := by
                      
                      have h₅₁₅ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by hole_25
                      have h₅₁₆ : (⌊(2 : ℝ) * a⌋ : ℤ) ≥ 2 * ⌊a⌋ := by
                        
                        hole_26
                      hole_24
                    have h₅₁₇ : (⌊(2 : ℝ) * a⌋ : ℤ) < 2 * ⌊a⌋ + 2 := by
                      
                      have h₅₁₈ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by hole_28
                      have h₅₁₉ : (⌊(2 : ℝ) * a⌋ : ℤ) < 2 * ⌊a⌋ + 2 := by
                        
                        hole_29
                      hole_27
                    
                    have h₅₂₀ : (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
                      hole_30
                    hole_23
                  
                  hole_22
                hole_19
              hole_16
            hole_11
          
          hole_10
        hole_9
        
        have h₅ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = 0 := by
          hole_33
        rw [h₅]
        <;> norm_num
      | inr h₄ =>
        
        have h₅ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = 1 := by
          hole_34
        rw [h₅]
        <;> norm_num
        <;> ring_nf at *
        <;> norm_num at *
        <;> linarith
    
    hole_5
  
  hole_1