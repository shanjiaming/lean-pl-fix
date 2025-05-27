theorem unique_solution'  : ∃! x, A.mulVec x = b ∧ x = solution :=
  by
  have h_main : A.mulVec solution = b := by sorry
  have h_exists : ∃ (x : Fin 2 → ℝ), A.mulVec x = b ∧ x = solution := by sorry
  have h_unique : ∀ (y : Fin 2 → ℝ), (A.mulVec y = b ∧ y = solution) → y = solution := by sorry
  have h_final : ∃! (x : Fin 2 → ℝ), A.mulVec x = b ∧ x = solution := by sorry
  --  exact h_final
  simpa