theorem inconsistentAugmentedMatrix (A : Matrix (Fin 2) (Fin 4) ℝ) :
isPivotColumn A 3 → ¬(∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
  admit