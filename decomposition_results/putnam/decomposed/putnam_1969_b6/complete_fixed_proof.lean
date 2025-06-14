theorem putnam_1969_b6
(A : Matrix (Fin 3) (Fin 2) ℝ)
(B : Matrix (Fin 2) (Fin 3) ℝ)
(p : Fin 3 → Fin 3 → ℝ)
(hp : p 0 0 = 8 ∧ p 0 1 = 2 ∧ p 0 2 = -2 ∧
p 1 0 = 2 ∧ p 1 1 = 5 ∧ p 1 2 = 4 ∧
p 2 0 = -2 ∧ p 2 1 = 4 ∧ p 2 2 = 5)
(hAB : A * B = Matrix.of p)
: B * A = 9 * (1 : Matrix (Fin 2) (Fin 2) ℝ) := by
  have hAB₁ : (A * B) 0 0 = 8 := by
    admit
  
  have hAB₂ : (A * B) 0 1 = 2 := by
    admit
  
  have hAB₃ : (A * B) 0 2 = -2 := by
    admit
  
  have hAB₄ : (A * B) 1 0 = 2 := by
    admit
  
  have hAB₅ : (A * B) 1 1 = 5 := by
    admit
  
  have hAB₆ : (A * B) 1 2 = 4 := by
    admit
  
  have hAB₇ : (A * B) 2 0 = -2 := by
    admit
  
  have hAB₈ : (A * B) 2 1 = 4 := by
    admit
  
  have hAB₉ : (A * B) 2 2 = 5 := by
    admit
  
  have hBA_sq : (B * A) * (B * A) = 9 * (B * A) := by
    have h₁ : (B * A) * (B * A) = B * (A * B) * A := by
      admit
    rw [h₁]
    have h₂ : A * B = Matrix.of p := hAB
    rw [h₂]
    have h₃ : B * (Matrix.of p) * A = 9 * (B * A) := by
      
      have h₄ : B * (Matrix.of p) * A = B * ((Matrix.of p) * A) := by
        admit
      rw [h₄]
      have h₅ : (Matrix.of p) * A = 9 * A := by
        
        admit
      admit
    admit
  
  have hBA_trace : Matrix.trace (B * A) = 18 := by
    have h₁ : Matrix.trace (B * A) = Matrix.trace (A * B) := by
      admit
    rw [h₁]
    have h₂ : Matrix.trace (A * B) = 18 := by
      admit
    admit
  
  have hBA_final : B * A = 9 * (1 : Matrix (Fin 2) (Fin 2) ℝ) := by
    have h₁ : (B * A) * (B * A) = 9 * (B * A) := hBA_sq
    have h₂ : Matrix.trace (B * A) = 18 := hBA_trace
    have h₃ : B * A = 9 * (1 : Matrix (Fin 2) (Fin 2) ℝ) := by
      have h₄ : B * A = 9 * (1 : Matrix (Fin 2) (Fin 2) ℝ) := by
        
        have h₅ : (B * A) * (B * A) = 9 * (B * A) := hBA_sq
        have h₆ : Matrix.trace (B * A) = 18 := hBA_trace
        
        have h₇ : B * A = 9 * (1 : Matrix (Fin 2) (Fin 2) ℝ) := by
          
          have h₈ : ∀ i j, (B * A) i j = (9 * (1 : Matrix (Fin 2) (Fin 2) ℝ)) i j := by
            intro i j
            have h₉ := congr_arg (fun m => m i j) h₅
            admit
          ext i j
          exact h₈ i j
        exact h₇
      exact h₄
    exact h₃
  
  rw [hBA_final]
  <;> simp
  <;> aesop