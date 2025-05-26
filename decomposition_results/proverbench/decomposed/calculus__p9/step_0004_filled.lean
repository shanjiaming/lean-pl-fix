theorem h3 (x✝ x : ℝ) : sin x ^ 3 = sin x * (1 - cos x ^ 2) :=
  by
  have h4 : Real.sin x ^ 2 + Real.cos x ^ 2 = 1 := Real.sin_sq_add_cos_sq x
  have h5 : Real.sin x ^ 3 = Real.sin x * (Real.sin x ^ 2) := by sorry
  rw [h5]
  have h6 : Real.sin x ^ 2 = 1 - Real.cos x ^ 2 := by sorry
  rw [h6] <;> ring
  hole