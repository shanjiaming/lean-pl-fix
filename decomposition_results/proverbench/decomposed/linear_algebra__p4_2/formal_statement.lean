/-- Corollary: If any column of a 2x4 augmented matrix is a pivot column, the system is either inconsistent or has a unique solution. -/
theorem pivotColumnImpliesUniqueOrInconsistent (A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) :
isPivotColumn A j → (¬∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) ∨ (∃! x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) :=