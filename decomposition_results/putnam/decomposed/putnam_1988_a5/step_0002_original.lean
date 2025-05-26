theorem h_main  : ∃ f,
    (∀ x > 0, f (f x) = 6 * x - f x ∧ f x > 0) ∧
      ∀ (g : ℝ → ℝ), (∀ x > 0, g (g x) = 6 * x - g x ∧ g x > 0) → ∀ x > 0, f x = g x :=
  by
  use fun x => 2 * x
  constructor
  · intro x hx
    constructor
    ·
      have h₁ : (2 : ℝ) * (2 * x) = 6 * x - 2 * x := by sorry
      exact h₁
    ·
      have h₂ : (2 : ℝ) * x > 0 := by sorry
      exact h₂
  · intro g hg x hx
    have h₁ : g x = 2 * x := by sorry
    rw [h₁] <;> ring <;> linarith