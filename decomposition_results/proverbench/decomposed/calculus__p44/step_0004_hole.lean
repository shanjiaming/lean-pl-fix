theorem h₂  : ∀ (x : ℝ), x ≠ 0 → cos x > 0 → cos x ^ sin x = rexp (Real.log (cos x) * sin x) :=
  by
  --  intro x hx hcos
  --  rw [Real.rpow_def_of_pos hcos] <;> simp [Real.exp_log hcos]
  hole