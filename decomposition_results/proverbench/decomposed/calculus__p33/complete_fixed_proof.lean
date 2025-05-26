theorem composition_of_sine_and_quadratic (x : ℝ) : u (v x) = Real.sin (x ^ 2):=
  by
  have h₁ : u (v x) = Real.sin (x ^ 2):= by
    --  calc
    --    u (v x) = u (x ^ 2) := by rw [v]
    --    _ = Real.sin (x ^ 2) := by rw [u]
    --    _ = Real.sin (x ^ 2) := by rfl
    hole
  --  exact h₁
  hole