theorem h2 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ)) (hmats01 : mats01 = {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}) : 2 * n ≥ 2 := by
  have h3 : n ≥ 1 := npos
  have h4 : 2 * n ≥ 2 := by sorry
  --  exact h4
  linarith