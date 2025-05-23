theorem putnam_1992_b5
  (D : ℕ → ℚ)
  (hD : ∀ n, D n = Matrix.det (fun i j : Fin (n - 1) ↦ ite (i = j) ((i : ℕ) + 3 : ℚ) 1)) :
  ((False) : Prop ) ↔ (Bornology.IsBounded {x | ∃ n ≥ 2, D n / factorial n = x}) := by