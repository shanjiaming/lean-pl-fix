theorem h₂ (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h : A.rank = (A.fromColumns B).rank) (h₁ : (∃ X, A * X = B) ∨ ¬∃ X, A * X = B) : ∃ X, A * X = B := by
  cases h₁ with
  | inl h₁ => exact h₁
  | inr
    h₁ =>
    have h₃ : rank A ≠ rank (fromColumns A B) :=
      by
      have h₄ : ¬(∃ (X : Matrix n p R), A * X = B) := h₁
      have h₅ : rank A = rank (fromColumns A B) → (∃ (X : Matrix n p R), A * X = B) :=
        by
        intro h₆
        exfalso
        exact h₄ (by tauto)
      have h₆ : rank A ≠ rank (fromColumns A B) := by
        by_contra h₇
        have h₈ : rank A = rank (fromColumns A B) := by tauto
        have h₉ : ∃ (X : Matrix n p R), A * X = B :=
          by
          have h₁₀ : rank A = rank (fromColumns A B) := h₈
          have h₁₁ : (∃ (X : Matrix n p R), A * X = B) := by
            exact rankConditionIfSolutionExists A B (by tauto) |>.symm ▸ h₁₀
          exact h₁₁
        exact h₄ h₉
      exact h₆
    exfalso
    exact h₃ h