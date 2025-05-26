theorem putnam_1990_a5 :
  ((False) : Prop ) ↔
  (∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ,
    A * B * A * B = 0 → B * A * B * A = 0) := by