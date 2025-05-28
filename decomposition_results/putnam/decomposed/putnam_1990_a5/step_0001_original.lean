theorem putnam_1990_a5  : False ↔ ∀ n ≥ 1, ∀ (A B : Matrix (Fin n) (Fin n) ℝ), A * B * A * B = 0 → B * A * B * A = 0 :=
  by
  have h1 : False → (∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0) := by sorry
  have h2 : (∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0) → False := by sorry
  apply Iff.intro h1 h2