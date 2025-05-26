theorem f_initial_condition (u : ℝ) : sorry = u ^ 2 * rexp (-u) :=
  by
  have h₁ : f u 0 = (u ^ 2 + 0 ^ 2 : ℝ) * exp (-(u + 0)) := by sorry
  have h₂ : f u 0 = u ^ 2 * exp (-u) := by sorry
  rw [h₂] <;> norm_num <;> ring_nf <;> simp [Real.exp_neg] <;> field_simp <;> ring <;> norm_num