macro "hole_1" : tactic => `(tactic| admit)

theorem inconsistentAugmentedMatrix (A : Matrix (Fin 2) (Fin 4) ℝ) :
isPivotColumn A 3 → ¬(∃ x : Fin 4 → ℝ, A.mulVec x = (fun i => A i 3)) := by
  hole_1