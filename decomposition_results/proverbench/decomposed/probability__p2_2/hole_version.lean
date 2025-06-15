macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem A_cubed : A * (A * A) = ![![0.26, 0.38, 0.52], ![0.16, 0.18, 0.195], ![0.58, 0.44, 0.285]] := by
  have h₁ : A * (A * A) = ![![0.26, 0.38, 0.52], ![0.16, 0.18, 0.195], ![0.58, 0.44, 0.285]] := by
    hole_2
  hole_1