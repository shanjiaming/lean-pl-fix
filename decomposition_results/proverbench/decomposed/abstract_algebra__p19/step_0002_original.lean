theorem h_false (P : Polynomial ℝ) (hP : ∀ x ≥ 0, Polynomial.eval x P ≥ 0) : False := by
  classical
  exfalso
  have h₁ : False := by
    have h₂ : False := by exact False.elim (by trivial)
    exact h₂
  exact h₁