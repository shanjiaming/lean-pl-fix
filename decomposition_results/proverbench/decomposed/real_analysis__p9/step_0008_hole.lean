theorem h₃ (D : Type u_1) (f : D → ℝ) (X : Set D) (h : ∃ M > 0, ∀ x ∈ X, |f x| ≤ M) (h₁ : BddAbove (f '' X)) (h₂ : BddBelow (f '' X)) : BoundedOn f X := by -- exact ⟨h₁, h₂⟩
  hole