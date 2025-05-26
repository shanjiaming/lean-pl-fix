theorem h_final (P : ℝ × ℝ → Prop) (hP :  P = fun x =>    match x with    | (x, y) => x ^ 2 + y ^ 2 = 1) (h_main : ¬∃ B ⊆ setOf P, IsClosed B ∧ ∀ (x y : ℝ), P (x, y) → Xor' ((x, y) ∈ B) ((-x, -y) ∈ B)) : (∃ B ⊆ setOf P, IsClosed B ∧ ∀ (x y : ℝ), P (x, y) → Xor' ((x, y) ∈ B) ((-x, -y) ∈ B)) ↔ False :=
  by
  constructor
  · intro h
    exact h_main h
  · intro h
    exfalso
    exact h