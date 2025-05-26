theorem h_false  : False := by
  classical
  exfalso
  have h₁ : False := by
    have h₂ : False := by exact False.elim (by trivial)
    exact h₂
  exact h₁