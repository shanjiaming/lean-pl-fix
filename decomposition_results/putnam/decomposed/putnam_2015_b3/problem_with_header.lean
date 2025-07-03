import Mathlib

-- {A : Matrix (Fin 2) (Fin 2) ℝ | (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨ (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)}
/--
Let $S$ be the set of all $2 \times 2$ real matrices $M=\begin{pmatrix} a & b \\ c & d \end{pmatrix}$ whose entries $a,b,c,d$ (in that order) form an arithmetic progression. Find all matrices $M$ in $S$ for which there is some integer $k>1$ such that $M^k$ is also in $S$.
-/
theorem putnam_2015_b3
  (M : Matrix (Fin 2) (Fin 2) ℝ)
  (S : Set (Matrix (Fin 2) (Fin 2) ℝ))
  (hS : S = {M' | (M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1) ∧ (M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0)}) :
  (M ∈ S ∧ (∃ k > 1, M ^ k ∈ S)) ↔ M ∈ (({A : Matrix (Fin 2) (Fin 2) ℝ | (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨ (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)}) : Set (Matrix (Fin 2) (Fin 2) ℝ) ) := by
  have h_main : (M ∈ S ∧ (∃ k > 1, M ^ k ∈ S)) ↔ M ∈ ({A : Matrix (Fin 2) (Fin 2) ℝ | (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨ (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)} : Set (Matrix (Fin 2) (Fin 2) ℝ)) := by
    rw [hS]
    constructor
    · -- Prove the forward direction: if M ∈ S and ∃ k > 1, M^k ∈ S, then M is either constant or a scalar multiple of [[-3, -1], [1, 3]]
      rintro ⟨hM, ⟨k, hk, hMk⟩⟩
      have h₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := hM.1
      have h₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := hM.2
      have h₃ : (∃ (α : ℝ), ∀ (i j : Fin 2), M i j = α * 1) ∨ (∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) := by
        -- Consider the cases where M is a constant matrix or a scalar multiple of [[-3, -1], [1, 3]]
        by_cases h : M 0 0 = M 0 1
        · -- Case 1: M is a constant matrix
          have h₄ : ∀ (i j : Fin 2), M i j = M 0 0 := by
            intro i j
            fin_cases i <;> fin_cases j <;>
              (try {linarith}) <;>
              (try {
                have h₅ := h₁
                have h₆ := h₂
                simp [Fin.forall_fin_two] at h₅ h₆ ⊢
                <;> linarith
              })
          exact Or.inl ⟨M 0 0, by
            intro i j
            have h₅ := h₄ i j
            have h₆ := h₄ ⟨0, by decide⟩ ⟨0, by decide⟩
            simp at h₅ h₆ ⊢
            <;> linarith⟩
        · -- Case 2: M is a scalar multiple of [[-3, -1], [1, 3]]
          have h₄ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
          have h₅ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
          have h₆ : M 0 0 ≠ M 0 1 := h
          have h₇ : ∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3 := by
            use -M 0 0 / 3
            have h₈ : M 0 0 ≠ M 0 1 := h₆
            have h₉ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
            have h₁₀ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
            constructor
            · -- Prove M 0 0 = (-M 0 0 / 3) * -3
              ring
            · constructor
              · -- Prove M 0 1 = (-M 0 0 / 3) * -1
                have h₁₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
                have h₁₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
                have h₁₃ : M 0 1 = (-M 0 0 / 3) * -1 := by
                  ring_nf at h₁ h₂ ⊢
                  <;> linarith
                exact h₁₃
              · constructor
                · -- Prove M 1 0 = (-M 0 0 / 3) * 1
                  have h₁₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
                  have h₁₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
                  have h₁₃ : M 1 0 = (-M 0 0 / 3) * 1 := by
                    ring_nf at h₁ h₂ ⊢
                    <;> linarith
                  exact h₁₃
                · -- Prove M 1 1 = (-M 0 0 / 3) * 3
                  have h₁₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
                  have h₁₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
                  have h₁₃ : M 1 1 = (-M 0 0 / 3) * 3 := by
                    ring_nf at h₁ h₂ ⊢
                    <;> linarith
                  exact h₁₃
          exact Or.inr h₇
      exact h₃
    · -- Prove the reverse direction: if M is either constant or a scalar multiple of [[-3, -1], [1, 3]], then M ∈ S and ∃ k > 1, M^k ∈ S
      intro h
      have h₁ : (∃ (α : ℝ), ∀ (i j : Fin 2), M i j = α * 1) ∨ (∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) := h
      have h₂ : M 0 1 - M 0 0 = M 1 0 - M 0 1 ∧ M 1 0 - M 0 1 = M 1 1 - M 1 0 := by
        cases h₁ with
        | inl h₁ =>
          -- Case 1: M is a constant matrix
          obtain ⟨α, hα⟩ := h₁
          have h₃ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := by
            have h₄ := hα ⟨0, by decide⟩ ⟨1, by decide⟩
            have h₅ := hα ⟨1, by decide⟩ ⟨0, by decide⟩
            have h₆ := hα ⟨0, by decide⟩ ⟨0, by decide⟩
            have h₇ := hα ⟨1, by decide⟩ ⟨1, by decide⟩
            simp at h₄ h₅ h₆ h₇ ⊢
            <;> linarith
          have h₄ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := by
            have h₅ := hα ⟨0, by decide⟩ ⟨1, by decide⟩
            have h₆ := hα ⟨1, by decide⟩ ⟨0, by decide⟩
            have h₇ := hα ⟨0, by decide⟩ ⟨0, by decide⟩
            have h₈ := hα ⟨1, by decide⟩ ⟨1, by decide⟩
            simp at h₅ h₆ h₇ h₈ ⊢
            <;> linarith
          exact ⟨h₃, h₄⟩
        | inr h₁ =>
          -- Case 2: M is a scalar multiple of [[-3, -1], [1, 3]]
          obtain ⟨β, hβ₁, hβ₂, hβ₃, hβ₄⟩ := h₁
          have h₃ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := by
            have h₄ := hβ₁
            have h₅ := hβ₂
            have h₆ := hβ₃
            have h₇ := hβ₄
            ring_nf at h₄ h₅ h₆ h₇ ⊢
            <;> linarith
          have h₄ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := by
            have h₅ := hβ₁
            have h₆ := hβ₂
            have h₇ := hβ₃
            have h₈ := hβ₄
            ring_nf at h₅ h₆ h₇ h₈ ⊢
            <;> linarith
          exact ⟨h₃, h₄⟩
      have h₃ : M ∈ {M' | (M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1) ∧ (M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0)} := by
        exact h₂
      have h₄ : ∃ k > 1, (M ^ k) ∈ {M' | (M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1) ∧ (M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0)} := by
        cases h₁ with
        | inl h₁ =>
          -- Case 1: M is a constant matrix
          obtain ⟨α, hα⟩ := h₁
          use 2
          constructor
          · -- Prove 2 > 1
            norm_num
          · -- Prove M ^ 2 ∈ S
            have h₅ : ∀ (i j : Fin 2), M i j = α * 1 := hα
            have h₆ : (M ^ 2) 0 1 - (M ^ 2) 0 0 = (M ^ 2) 1 0 - (M ^ 2) 0 1 := by
              have h₇ := h₅ ⟨0, by decide⟩ ⟨0, by decide⟩
              have h₈ := h₅ ⟨0, by decide⟩ ⟨1, by decide⟩
              have h₉ := h₅ ⟨1, by decide⟩ ⟨0, by decide⟩
              have h₁₀ := h₅ ⟨1, by decide⟩ ⟨1, by decide⟩
              simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_two] at h₇ h₈ h₉ h₁₀ ⊢
              <;> ring_nf at h₇ h₈ h₉ h₁₀ ⊢ <;> simp [h₇, h₈, h₉, h₁₀] <;> ring_nf <;> linarith
            have h₇ : (M ^ 2) 1 0 - (M ^ 2) 0 1 = (M ^ 2) 1 1 - (M ^ 2) 1 0 := by
              have h₈ := h₅ ⟨0, by decide⟩ ⟨0, by decide⟩
              have h₉ := h₅ ⟨0, by decide⟩ ⟨1, by decide⟩
              have h₁₀ := h₅ ⟨1, by decide⟩ ⟨0, by decide⟩
              have h₁₁ := h₅ ⟨1, by decide⟩ ⟨1, by decide⟩
              simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_two] at h₈ h₉ h₁₀ h₁₁ ⊢
              <;> ring_nf at h₈ h₉ h₁₀ h₁₁ ⊢ <;> simp [h₈, h₉, h₁₀, h₁₁] <;> ring_nf <;> linarith
            exact ⟨h₆, h₇⟩
        | inr h₁ =>
          -- Case 2: M is a scalar multiple of [[-3, -1], [1, 3]]
          obtain ⟨β, hβ₁, hβ₂, hβ₃, hβ₄⟩ := h₁
          use 3
          constructor
          · -- Prove 3 > 1
            norm_num
          · -- Prove M ^ 3 ∈ S
            have h₅ : M 0 0 = β * -3 := hβ₁
            have h₆ : M 0 1 = β * -1 := hβ₂
            have h₇ : M 1 0 = β * 1 := hβ₃
            have h₈ : M 1 1 = β * 3 := hβ₄
            have h₉ : (M ^ 3) 0 1 - (M ^ 3) 0 0 = (M ^ 3) 1 0 - (M ^ 3) 0 1 := by
              simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_succ, pow_two, h₅, h₆, h₇, h₈]
              <;> ring_nf
              <;> nlinarith
            have h₁₀ : (M ^ 3) 1 0 - (M ^ 3) 0 1 = (M ^ 3) 1 1 - (M ^ 3) 1 0 := by
              simp [Matrix.mul_apply, Fin.sum_univ_succ, pow_succ, pow_two, h₅, h₆, h₇, h₈]
              <;> ring_nf
              <;> nlinarith
            exact ⟨h₉, h₁₀⟩
      exact ⟨h₃, h₄⟩
  exact h_main