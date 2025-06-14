macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem max_xy_on_unit_circle :
  (x^2 + y^2 = 1) → (x * y ≤ 1 / 2) ∧ ((x = 1 / sqrt 2 ∧ y = 1 / sqrt 2) ∨ (x = -1 / sqrt 2 ∧ y = -1 / sqrt 2)) → (x * y = 1 / 2) := by
  intro h₁ h₂
  have h₃ : x * y = 1 / 2 := by
    have h₄ : (x = 1 / Real.sqrt 2 ∧ y = 1 / Real.sqrt 2) ∨ (x = -1 / Real.sqrt 2 ∧ y = -1 / Real.sqrt 2) := by
      hole_3
    hole_2
  hole_1