theorem solutionExistsIfRankCondition (A : Matrix m n R) (B : Matrix m p R) :
  rank A = rank (fromColumns A B) → ∃ X : Matrix n p R, A * X = B:=
  by
  intro h
  have h₁ : (∃ (X : Matrix n p R), A * X = B) ∨ ¬(∃ (X : Matrix n p R), A * X = B):=
    by
    by_cases h' : ∃ (X : Matrix n p R), A * X = B
    · exact Or.inl h'
    · exact Or.inr h'
    hole
  have h₂ : ∃ (X : Matrix n p R), A * X = B:= by
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
    hole
  exact h₂
  hole