theorem h₃ (D : Type u_1) (f : D → ℝ) (X : Set D) (M : ℝ) (hM_pos : M > 0) (hM : ∀ x ∈ X, |f x| ≤ M) (x : D) (hx : x ∈ X) (h₂ : |f x| ≤ M) : f x ≤ M := by -- linarith [abs_le.mp h₂]
  hole