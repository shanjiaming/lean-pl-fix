theorem h₂ (D : Type u_1) (f : D → ℝ) (X : Set D) (h : ∃ M > 0, ∀ x ∈ X, |f x| ≤ M) (h₁ : BddAbove (f '' X)) : BddBelow (f '' X) := by
  obtain ⟨M, hM_pos, hM⟩ := h
  refine' ⟨-M, _⟩
  rintro _ ⟨x, hx, rfl⟩
  have h₃ : |f x| ≤ M := hM x hx
  have h₄ : -M ≤ f x := by sorry
  exact h₄