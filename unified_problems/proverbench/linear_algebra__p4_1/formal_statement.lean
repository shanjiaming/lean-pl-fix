/-- Theorem: If the last column of a 2x4 augmented matrix is a pivot column, the system is inconsistent. -/
theorem inconsistentAugmentedMatrix (A : Matrix (Fin 2) (Fin 4) ℝ) :
isPivotColumn A 3 → ¬(∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) :=