theorem h₁ (D : Type u_1) (f : D → ℝ) (X : Set D) (h : ∃ M > 0, ∀ x ∈ X, |f x| ≤ M) : BddAbove (f '' X) := by
  --  obtain ⟨M, hM_pos, hM⟩ := h
  --  refine' ⟨M, _⟩
  --  rintro _ ⟨x, hx, rfl⟩
  have h₂ : |f x| ≤ M := hM x hx
  have h₃ : f x ≤ M := by sorry
  --  exact h₃
  hole