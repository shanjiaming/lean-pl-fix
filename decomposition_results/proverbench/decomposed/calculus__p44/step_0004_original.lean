theorem h₂  : ∀ (x : ℝ), x ≠ 0 → Real.cos x > 0 → Real.cos x ^ Real.sin x = Real.exp (Real.log (Real.cos x) * Real.sin x) :=
  by
  intro x hx hcos
  rw [Real.rpow_def_of_pos hcos] <;> simp [Real.exp_log hcos]