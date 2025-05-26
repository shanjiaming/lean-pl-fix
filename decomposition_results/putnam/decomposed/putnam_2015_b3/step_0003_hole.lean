theorem h₃ (M : Matrix (Fin 2) (Fin 2) ℝ) (S : Set (Matrix (Fin 2) (Fin 2) ℝ)) (hS : S = {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) (hM : M ∈ {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) (k : ℕ) (hk : k > 1) (hMk : M ^ k ∈ {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) (h₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1) (h₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0) : (∃ α, ∀ (i j : Fin 2), M i j = α * 1) ∨ ∃ β, M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3 :=
  by
  --  by_cases h : M 0 0 = M 0 1
  ·
    have h₄ : ∀ (i j : Fin 2), M i j = M 0 0 := by sorry
  --    exact
  --      Or.inl
  --        ⟨M 0 0, by
  --          intro i j
  --          have h₅ := h₄ i j
  --          have h₆ := h₄ ⟨0, by decide⟩ ⟨0, by decide⟩
  --          simp at h₅ h₆ ⊢ <;> linarith⟩
  ·
    have h₄ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
    have h₅ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
    have h₆ : M 0 0 ≠ M 0 1 := h
    have h₇ : ∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3 := by sorry
  --    exact Or.inr h₇
  hole