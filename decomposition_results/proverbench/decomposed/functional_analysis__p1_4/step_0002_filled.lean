theorem h₁ (u v x✝ y✝ x y : ℝ) : g x y = f x (y - x) := by
  rfl <;> simp [g, f] <;> ring <;> simp_all [exp_neg] <;> field_simp [exp_ne_zero] <;> ring <;> simp_all [exp_neg] <;>
      field_simp [exp_ne_zero] <;>
    ring
  hole