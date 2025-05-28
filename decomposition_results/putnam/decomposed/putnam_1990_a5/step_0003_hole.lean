theorem h2 (h1 : False → ∀ n ≥ 1, ∀ (A B : Matrix (Fin n) (Fin n) ℝ), A * B * A * B = 0 → B * A * B * A = 0) : (∀ n ≥ 1, ∀ (A B : Matrix (Fin n) (Fin n) ℝ), A * B * A * B = 0 → B * A * B * A = 0) → False :=
  by
  --  intro h
  have h3 : ∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0 := h
  have h4 : (∀ A B : Matrix (Fin 4) (Fin 4) ℝ, A * B * A * B = 0 → B * A * B * A = 0) := by sorry
  have h6 : (∀ A B : Matrix (Fin 4) (Fin 4) ℝ, A * B * A * B = 0 → B * A * B * A = 0) := h4
  --  let A : Matrix (Fin 4) (Fin 4) ℝ := !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]
  --  let B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]
  have h7 : A * B * A * B = 0 := by sorry
  have h8 : B * A * B * A = 0 → False := by sorry
  have h9 : B * A * B * A = 0 := h6 A B h7
  --  exact h8 h9
  hole