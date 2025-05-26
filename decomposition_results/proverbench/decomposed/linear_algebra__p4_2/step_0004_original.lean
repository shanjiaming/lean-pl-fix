theorem h₂ (A : Matrix (Fin 2) (Fin 4) ℝ) (j : Fin 4) (h : sorry) (h₀ : j = 3 ∨ j ≠ 3) (hj : j = 3) : ¬∃ x, A.mulVec x = fun i => A i 3 :=
  by
  have h₃ : isPivotColumn A 3 := by sorry
  exact inconsistentAugmentedMatrix A h₃