theorem h_main (M : Matrix (Fin 2) (Fin 2) ℝ) (S : Set (Matrix (Fin 2) (Fin 2) ℝ)) (hS : S = {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) : (M ∈ S ∧ ∃ k > 1, M ^ k ∈ S) ↔
    M ∈
      {A | (∃ α, ∀ (i j : Fin 2), A i j = α * 1) ∨ ∃ β, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3} :=
  by
  rw [hS]
  constructor
  · rintro ⟨hM, ⟨k, hk, hMk⟩⟩
    have h₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := hM.1
    have h₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := hM.2
    have h₃ :
      (∃ (α : ℝ), ∀ (i j : Fin 2), M i j = α * 1) ∨
        (∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) := by sorry
    exact h₃
  · intro h
    have h₁ :
      (∃ (α : ℝ), ∀ (i j : Fin 2), M i j = α * 1) ∨
        (∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) :=
      h
    have h₂ : M 0 1 - M 0 0 = M 1 0 - M 0 1 ∧ M 1 0 - M 0 1 = M 1 1 - M 1 0 := by sorry
    have h₃ : M ∈ {M' | (M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1) ∧ (M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0)} := by sorry
    have h₄ : ∃ k > 1, (M ^ k) ∈ {M' | (M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1) ∧ (M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0)} := by sorry
    exact ⟨h₃, h₄⟩