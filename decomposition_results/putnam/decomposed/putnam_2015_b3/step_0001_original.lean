theorem putnam_2015_b3 (M : Matrix (Fin 2) (Fin 2) ℝ) (S : Set (Matrix (Fin 2) (Fin 2) ℝ)) (hS : S = {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) : (M ∈ S ∧ ∃ k > 1, M ^ k ∈ S) ↔
    M ∈
      {A | (∃ α, ∀ (i j : Fin 2), A i j = α * 1) ∨ ∃ β, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3} :=
  by
  have h_main :
    (M ∈ S ∧ (∃ k > 1, M ^ k ∈ S)) ↔
      M ∈
        ({A : Matrix (Fin 2) (Fin 2) ℝ |
            (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨
              (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)} :
          Set (Matrix (Fin 2) (Fin 2) ℝ)) := by sorry
  exact h_main