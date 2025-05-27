theorem pivotColumnImpliesUniqueOrInconsistent (A✝ A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) : isPivotColumn A j → (¬∃ x, A *ᵥ x = fun i => A i 3) ∨ ∃! x, A *ᵥ x = fun i => A i 3 :=
  by
  intro h
  have h₀ : j = 3 ∨ j ≠ 3 := by sorry
  have h₁ :
    j = 3 → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by sorry
  have h₂ :
    j ≠ 3 → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by sorry
  have h_main : (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by sorry
  tauto
  hole