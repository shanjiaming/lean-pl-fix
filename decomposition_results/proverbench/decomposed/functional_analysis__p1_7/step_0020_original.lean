theorem h_backward (u✝ v✝ x y u v : ℝ) (h_forward : f u v = 0 → u = 0 ∧ v = 0) : u = 0 ∧ v = 0 → f u v = 0 := by
  rintro ⟨rfl, rfl⟩
  simp [f] <;> norm_num <;> ring_nf <;> simp [Real.exp_zero] <;> ring_nf <;> norm_num