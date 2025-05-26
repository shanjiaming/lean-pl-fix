theorem h₁ (z : ℂ) (hzrat : ∃ q1 q2, z.re = (↑q1 : ℝ) ∧ z.im = (↑q2 : ℝ)) (hznorm : ‖z‖ = 1) (n : ℤ) : ‖z ^ (2 * n) - 1‖ = ‖z ^ n - star z ^ n‖ :=
  by
  have h₂ : z ^ (2 * n) - 1 = z ^ n * (z ^ n - (star z) ^ n) := by sorry
  --  calc
  --    ‖z ^ (2 * n) - 1‖ = ‖z ^ n * (z ^ n - (star z) ^ n)‖ := by rw [h₂]
  --    _ = ‖z ^ n‖ * ‖z ^ n - (star z) ^ n‖ := by simp [norm_mul]
  --    _ = ‖z ^ n - (star z) ^ n‖ :=
  --      by
  --      have h₃ : ‖z ^ n‖ = 1 := by
  --        calc
  --          ‖z ^ n‖ = ‖z‖ ^ n := by simp [norm_zpow]
  --          _ = 1 ^ n := by rw [hznorm]
  --          _ = 1 := by simp
  --      rw [h₃] <;> simp
  --    _ = ‖z ^ n - (star z) ^ n‖ := by rfl
  hole