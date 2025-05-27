theorem h₂ (x✝ x : ℝ) (h₁ : cos_taylor_series x = cos x) : cos x = cos_taylor_series x := by rw [h₁] <;> simp [cos_taylor_series] <;> norm_num
  hole