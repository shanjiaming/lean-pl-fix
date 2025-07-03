import Mathlib

-- {A : Matrix (Fin 2) (Fin 2) ℝ | (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨ (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)}
/--
Let $S$ be the set of all $2 \times 2$ real matrices $M=\begin{pmatrix} a & b \\ c & d \end{pmatrix}$ whose entries $a,b,c,d$ (in that order) form an arithmetic progression. Find all matrices $M$ in $S$ for which there is some integer $k>1$ such that $M^k$ is also in $S$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)

theorem putnam_2015_b3
  (M : Matrix (Fin 2) (Fin 2) ℝ)
  (S : Set (Matrix (Fin 2) (Fin 2) ℝ))
  (hS : S = {M' | (M' 0 1 - M' 0 0 = M' 1 0 - M' 0 1) ∧ (M' 1 0 - M' 0 1 = M' 1 1 - M' 1 0)}) :
  (M ∈ S ∧ (∃ k > 1, M ^ k ∈ S)) ↔ M ∈ (({A : Matrix (Fin 2) (Fin 2) ℝ | (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨ (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)}) : Set (Matrix (Fin 2) (Fin 2) ℝ) ) := by
  have h_main : (M ∈ S ∧ (∃ k > 1, M ^ k ∈ S)) ↔ M ∈ ({A : Matrix (Fin 2) (Fin 2) ℝ | (∃ α : ℝ, ∀ i j : Fin 2, A i j = α * 1) ∨ (∃ β : ℝ, A 0 0 = β * -3 ∧ A 0 1 = β * -1 ∧ A 1 0 = β * 1 ∧ A 1 1 = β * 3)} : Set (Matrix (Fin 2) (Fin 2) ℝ)) := by
    rw [hS]
    constructor
    · 
      rintro ⟨hM, ⟨k, hk, hMk⟩⟩
      have h₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := hM.1
      have h₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := hM.2
      have h₃ : (∃ (α : ℝ), ∀ (i j : Fin 2), M i j = α * 1) ∨ (∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) := by
        
        by_cases h : M 0 0 = M 0 1
        · 
          have h₄ : ∀ (i j : Fin 2), M i j = M 0 0 := by
            hole_1
          exact Or.inl ⟨M 0 0, by
            intro i j
            have h₅ := h₄ i j
            have h₆ := h₄ ⟨0, by decide⟩ ⟨0, by decide⟩
            simp at h₅ h₆ ⊢
            <;> linarith⟩
        · 
          have h₄ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
          have h₅ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
          have h₆ : M 0 0 ≠ M 0 1 := h
          have h₇ : ∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3 := by
            use -M 0 0 / 3
            have h₈ : M 0 0 ≠ M 0 1 := h₆
            have h₉ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
            have h₁₀ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
            constructor
            · 
              ring
            · constructor
              · 
                have h₁₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
                have h₁₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
                have h₁₃ : M 0 1 = (-M 0 0 / 3) * -1 := by
                  hole_2
                exact h₁₃
              · constructor
                · 
                  have h₁₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
                  have h₁₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
                  have h₁₃ : M 1 0 = (-M 0 0 / 3) * 1 := by
                    hole_3
                  exact h₁₃
                · 
                  have h₁₁ : M 0 1 - M 0 0 = M 1 0 - M 0 1 := h₁
                  have h₁₂ : M 1 0 - M 0 1 = M 1 1 - M 1 0 := h₂
                  have h₁₃ : M 1 1 = (-M 0 0 / 3) * 3 := by
                    hole_4
                  hole_5
          hole_6
      exact h₃
    · 
      intro h
      have h₁ : (∃ (α : ℝ), ∀ (i j : Fin 2), M i j = α * 1) ∨ (∃ (β : ℝ), M 0 0 = β * -3 ∧ M 0 1 = β * -1 ∧ M 1 0 = β * 1 ∧ M 1 1 = β * 3) := h
      have h₂ : M 0 1 - M 0 0 = M 1 0 - M 0 1 ∧ M 1 0 - M 0 1 = M 1 1 - M 1 0 := by
        hole_11
        | inl h₁ =>
          
          obtain ⟨α, hα⟩ := h₁
          use 2
          constructor
          · 
            norm_num
          · 
            have h₅ : ∀ (i j : Fin 2), M i j = α * 1 := hα
            have h₆ : (M ^ 2) 0 1 - (M ^ 2) 0 0 = (M ^ 2) 1 0 - (M ^ 2) 0 1 := by
              have h₇ := h₅ ⟨0, by decide⟩ ⟨0, by decide⟩
              have h₈ := h₅ ⟨0, by decide⟩ ⟨1, by decide⟩
              have h₉ := h₅ ⟨1, by decide⟩ ⟨0, by decide⟩
              have h₁₀ := h₅ ⟨1, by decide⟩ ⟨1, by decide⟩
              hole_13
            have h₇ : (M ^ 2) 1 0 - (M ^ 2) 0 1 = (M ^ 2) 1 1 - (M ^ 2) 1 0 := by
              have h₈ := h₅ ⟨0, by decide⟩ ⟨0, by decide⟩
              have h₉ := h₅ ⟨0, by decide⟩ ⟨1, by decide⟩
              have h₁₀ := h₅ ⟨1, by decide⟩ ⟨0, by decide⟩
              have h₁₁ := h₅ ⟨1, by decide⟩ ⟨1, by decide⟩
              hole_14
            exact ⟨h₆, h₇⟩
        | inr h₁ =>
          
          obtain ⟨β, hβ₁, hβ₂, hβ₃, hβ₄⟩ := h₁
          use 3
          constructor
          · 
            norm_num
          · 
            have h₅ : M 0 0 = β * -3 := hβ₁
            have h₆ : M 0 1 = β * -1 := hβ₂
            have h₇ : M 1 0 = β * 1 := hβ₃
            have h₈ : M 1 1 = β * 3 := hβ₄
            have h₉ : (M ^ 3) 0 1 - (M ^ 3) 0 0 = (M ^ 3) 1 0 - (M ^ 3) 0 1 := by
              hole_15
            have h₁₀ : (M ^ 3) 1 0 - (M ^ 3) 0 1 = (M ^ 3) 1 1 - (M ^ 3) 1 0 := by
              hole_16
            exact ⟨h₉, h₁₀⟩
      hole_18
  hole_19