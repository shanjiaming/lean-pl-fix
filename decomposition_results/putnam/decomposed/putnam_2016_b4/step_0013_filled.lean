theorem h5 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ)) (hmats01 : mats01 = {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}) (h1 : mats01.Infinite) (h2 : mats01.ncard = 0) (A : (↑mats01 : Type)) : 2 * n > 0 := by
  have h6 : n ≥ 1 := npos
  --  omega
  linarith