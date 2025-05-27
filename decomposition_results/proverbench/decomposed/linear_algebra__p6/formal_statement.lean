/-- Theorem: The systems `Ax = b1` and `Ax = b2` have unique solutions `x1 = (1, 0, 1)` and `x2 = (1, 1, 2)` respectively. -/
theorem unique_solutions :
  (∃! x1 : Fin 3 → ℚ, A.mulVec ![1, 0, 1] = b1) ∧
  (∃! x2 : Fin 3 → ℚ, A.mulVec ![1, 1, 2] = b2) ∧
  (∃ x1 x2 : Fin 3 → ℚ, A.mulVec x1 = b1 ∧ A.mulVec x2 = b2 ∧ x1 = ![1, 0, 1] ∧ x2 = ![1, 1, 2]) :=