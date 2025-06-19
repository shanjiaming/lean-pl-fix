macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)

theorem putnam_2005_b1
    : ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) ≠ 0 ∧ ∀ a : ℝ, MvPolynomial.eval (fun n : Fin 2 => if (n = 0) then (Int.floor a : ℝ) else (Int.floor (2 * a))) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) = 0 := by
  have h_main : ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) ≠ 0 := by
    intro h
    have h₁ : (MvPolynomial.eval (fun n => (if n = 0 then (1 : ℝ) else 0 : Fin 2 → ℝ)) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) : ℝ) = (0 : ℝ) := by
      admit
    have h₂ : (MvPolynomial.eval (fun n => (if n = 0 then (1 : ℝ) else 0 : Fin 2 → ℝ)) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1)) : ℝ) ≠ (0 : ℝ) := by
      admit
    admit
  
  have h_eval_zero : ∀ (a : ℝ), MvPolynomial.eval (fun n : Fin 2 => if (n = 0) then (Int.floor a : ℝ) else (Int.floor (2 * a))) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ ) = 0 := by
    intro a
    have h₁ : MvPolynomial.eval (fun n : Fin 2 => if n = 0 then (Int.floor a : ℝ) else (Int.floor (2 * a))) ((MvPolynomial.X 1 - 2 * MvPolynomial.X 0) * (MvPolynomial.X 1 - 2 * MvPolynomial.X 0 - 1) : MvPolynomial (Fin 2) ℝ) = (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a)) * (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a) - 1) := by
      norm_num
    rw [h₁]
    have h₂ : (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a)) * (↑(Int.floor (2 * a)) - 2 * ↑(Int.floor a) - 1) = 0 := by
      
      have h₃ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = (⌊2 * a⌋ - 2 * ⌊a⌋ : ℝ) := by norm_num
      have h₄ : (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 0 ∨ (⌊2 * a⌋ - 2 * ⌊a⌋ : ℤ) = 1 := by
        have h₅ : (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
          
          have h₅₁ : (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊2 * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
            have h₅₂ : a - 1 < ⌊a⌋ := by
              norm_num
            have h₅₃ : (⌊a⌋ : ℝ) ≤ a := by admit
            have h₅₄ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by linarith
            have h₅₅ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by linarith
            have h₅₆ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by
              have h₅₇ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by linarith
              have h₅₈ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by linarith
              have h₅₉ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by
                
                have h₅₁₀ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by linarith
                have h₅₁₁ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by linarith
                have h₅₁₂ : ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ ∨ ⌊(2 : ℝ) * a⌋ = 2 * ⌊a⌋ + 1 := by
                  have h₅₁₃ : (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
                    
                    have h₅₁₄ : (⌊(2 : ℝ) * a⌋ : ℤ) ≥ 2 * ⌊a⌋ := by
                      
                      have h₅₁₅ : (2 : ℝ) * (⌊a⌋ : ℝ) ≤ (2 : ℝ) * a := by linarith
                      have h₅₁₆ : (⌊(2 : ℝ) * a⌋ : ℤ) ≥ 2 * ⌊a⌋ := by
                        
                        admit
                      linarith
                    have h₅₁₇ : (⌊(2 : ℝ) * a⌋ : ℤ) < 2 * ⌊a⌋ + 2 := by
                      
                      have h₅₁₈ : (2 : ℝ) * a < (2 : ℝ) * (⌊a⌋ : ℝ) + 2 := by linarith
                      have h₅₁₉ : (⌊(2 : ℝ) * a⌋ : ℤ) < 2 * ⌊a⌋ + 2 := by
                        
                        admit
                      linarith
                    
                    have h₅₂₀ : (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ ∨ (⌊(2 : ℝ) * a⌋ : ℤ) = 2 * ⌊a⌋ + 1 := by
                      omega
                    omega
                  
                  omega
                omega
              omega
            omega
          
          omega
        omega
        
        have h₅ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = 0 := by
          admit
        rw [h₅]
        <;> norm_num
      | inr h₄ =>
        
        have h₅ : (⌊2 * a⌋ : ℝ) - 2 * (⌊a⌋ : ℝ) = 1 := by
          admit
        rw [h₅]
        <;> norm_num
        <;> ring_nf at *
        <;> norm_num at *
        <;> linarith
    
    admit
  
  admit
