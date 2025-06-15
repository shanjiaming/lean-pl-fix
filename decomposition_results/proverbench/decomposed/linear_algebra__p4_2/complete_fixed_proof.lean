theorem pivotColumnImpliesUniqueOrInconsistent (A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) :
isPivotColumn A j → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
  intro h
  have h₀ : j = 3 ∨ j ≠ 3 := by
    admit
  
  have h₁ : j = 3 → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
    intro hj
    have h₂ : ¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3) := by
      have h₃ : isPivotColumn A 3 := by admit
      admit
    admit
  
  have h₂ : j ≠ 3 → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
    admit
      
  have h_main : (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
    admit
  
  admit