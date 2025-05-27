theorem h₄ (D : Type u_1) (f : D → ℝ) (X : Set D) (h₁ : BddAbove (f '' X)) (M : ℝ) (hM_pos : M > 0) (hM : ∀ x ∈ X, |f x| ≤ M) (x : D) (hx : x ∈ X) (h₃ : |f x| ≤ M) : -M ≤ f x :=
  by
  have h₅ : -M ≤ -|f x| := by sorry
  have h₅₂ : -|f x| ≤ f x := by sorry
  linarith