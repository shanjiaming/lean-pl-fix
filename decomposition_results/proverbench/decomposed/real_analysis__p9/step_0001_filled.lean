theorem bounded_function_on_subset (D : Type u_1) (f : D → ℝ) (X : Set D) : (∃ M > 0, ∀ x ∈ X, |f x| ≤ M) → BoundedOn f X :=
  by
  --  intro h
  have h₁ : BddAbove (f '' X) := by sorry
  have h₂ : BddBelow (f '' X) := by sorry
  have h₃ : BoundedOn f X := by sorry
  --  exact h₃
  hole