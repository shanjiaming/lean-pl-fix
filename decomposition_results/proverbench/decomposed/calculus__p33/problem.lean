theorem composition_of_sine_and_quadratic (x : ℝ) : u (v x) = Real.sin (x ^ 2) := by
  have h₁ : u (v x) = Real.sin (x ^ 2) := by
    calc
      u (v x) = u (x ^ 2) := by
        -- Expand the definition of v
        rw [v]
      _ = Real.sin (x ^ 2) := by
        -- Expand the definition of u
        rw [u]
      _ = Real.sin (x ^ 2) := by rfl
  exact h₁