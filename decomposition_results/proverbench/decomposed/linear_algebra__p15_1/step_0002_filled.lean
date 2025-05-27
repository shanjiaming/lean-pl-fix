theorem h_scalar (E : Type) (inst✝¹ : NormedAddCommGroup E) (inst✝ : InnerProductSpace ℝ E) (v u : E) (hu : u ≠ 0) : ‖u‖ ^ 2 ≠ 0 := by
  have h1 : ‖u‖ ≠ 0 := by sorry
  exact by
    have h2 : ‖u‖ ^ 2 ≠ 0 := by positivity
    exact h2
  hole