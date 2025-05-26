theorem h₄ (M : Matrix (Fin 2) (Fin 2) ℝ) (S : Set (Matrix (Fin 2) (Fin 2) ℝ)) (hS : S = {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) (h :  M ∈ {A | (∃ α, ∀ (i j : Fin 2), A i j = α * 1) ∨ ∃ β, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3}) (h₁ : (∃ α, ∀ (i j : Fin 2), M i j = α * 1) ∨ ∃ β, M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) (h₂ : M 0 1 - M 0 0 = M 1 0 - M 0 1 ∧ M 1 0 - M 0 1 = M 1 1 - M 1 0) (h₃ : M ∈ {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0}) : ∃ k > 1, M ^ k ∈ {M' | M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1 ∧ M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0} := by
  cases h₁ with
  | inl h₁ =>
    obtain ⟨α, hα⟩ := h₁
    use 2
    constructor
    · norm_num
    ·
      have h₅ : ∀ (i j : Fin 2), M i j = α * 1 := hα
      have h₆ : (M ^ 2) 0 1 - (M ^ 2) 0 0 = (M ^ 2) 1 0 - (M ^ 2) 0 1 :=
        by
        have h₇ := h₅ ⟨0, by decide⟩ ⟨0, by decide⟩
        have h₈ := h₅ ⟨0, by decide⟩ ⟨1, by decide⟩
        have h₉ := h₅ ⟨1, by decide⟩ ⟨0, by decide⟩
        have h₁₀ := h₅ ⟨1, by decide⟩ ⟨1, by decide⟩
        simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_two] at h₇ h₈ h₉ h₁₀ ⊢ <;> ring_nf at h₇ h₈ h₉ h₁₀ ⊢ <;>
              simp [h₇, h₈, h₉, h₁₀] <;>
            ring_nf <;>
          linarith
      have h₇ : (M ^ 2) 1 0 - (M ^ 2) 0 1 = (M ^ 2) 1 1 - (M ^ 2) 1 0 :=
        by
        have h₈ := h₅ ⟨0, by decide⟩ ⟨0, by decide⟩
        have h₉ := h₅ ⟨0, by decide⟩ ⟨1, by decide⟩
        have h₁₀ := h₅ ⟨1, by decide⟩ ⟨0, by decide⟩
        have h₁₁ := h₅ ⟨1, by decide⟩ ⟨1, by decide⟩
        simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_two] at h₈ h₉ h₁₀ h₁₁ ⊢ <;> ring_nf at h₈ h₉ h₁₀ h₁₁ ⊢ <;>
              simp [h₈, h₉, h₁₀, h₁₁] <;>
            ring_nf <;>
          linarith
      exact ⟨h₆, h₇⟩
  | inr h₁ =>
    obtain ⟨β, hβ₁, hβ₂, hβ₃, hβ₄⟩ := h₁
    use 3
    constructor
    · norm_num
    ·
      have h₅ : M 0 0 = β * -3 := hβ₁
      have h₆ : M 0 1 = β * -1 := hβ₂
      have h₇ : M 1 0 = β * 1 := hβ₃
      have h₈ : M 1 1 = β * 3 := hβ₄
      have h₉ : (M ^ 3) 0 1 - (M ^ 3) 0 0 = (M ^ 3) 1 0 - (M ^ 3) 0 1 := by
        simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_succ, pow_two, h₅, h₆, h₇, h₈] <;> ring_nf <;> nlinarith
      have h₁₀ : (M ^ 3) 1 0 - (M ^ 3) 0 1 = (M ^ 3) 1 1 - (M ^ 3) 1 0 := by
        simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_succ, pow_two, h₅, h₆, h₇, h₈] <;> ring_nf <;> nlinarith
      exact ⟨h₉, h₁₀⟩