theorem h₁ (x : ℝ) : u (v x) = Real.sin (x ^ 2) := by
  calc
    u (v x) = u (x ^ 2) := by rw [v]
    _ = Real.sin (x ^ 2) := by rw [u]
    _ = Real.sin (x ^ 2) := by rfl