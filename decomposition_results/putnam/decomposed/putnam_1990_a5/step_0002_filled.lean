theorem h1  : False → ∀ n ≥ 1, ∀ (A B : Matrix (Fin n) (Fin n) ℝ), A * B * A * B = 0 → B * A * B * A = 0 :=
  by
  --  intro h
  --  exfalso
  --  exact h
  norm_num