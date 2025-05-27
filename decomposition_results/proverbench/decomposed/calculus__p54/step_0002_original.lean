theorem h_main  : ∀ (x : ℝ), π / 2 ≤ x → x ≤ 200 → f (4 * π / 3) ≤ f x :=
  by
  intro x hx1 hx2
  have h₁ : f (4 * π / 3) ≤ f x := by sorry
  exact h₁