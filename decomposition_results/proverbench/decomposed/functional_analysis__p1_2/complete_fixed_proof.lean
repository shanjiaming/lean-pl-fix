theorem f_initial_condition (u : ℝ) : f u 0 = u ^ 2 * exp (-u):=
  by
  have h₁ : f u 0 = (u ^ 2 + 0 ^ 2 : ℝ) * exp (-(u + 0)):= by
    --  calc
    --    f u 0 = (u ^ 2 + (0 : ℝ) ^ 2) * Real.exp (-(u + 0)) := rfl
    --    _ = (u ^ 2 + 0 ^ 2 : ℝ) * Real.exp (-(u + 0)) := by norm_num
    --    _ = (u ^ 2 + 0 ^ 2 : ℝ) * Real.exp (-(u + 0)) := rfl
    hole
  have h₂ : f u 0 = u ^ 2 * exp (-u):= by
    --  calc
    --    f u 0 = (u ^ 2 + 0 ^ 2 : ℝ) * Real.exp (-(u + 0)) := h₁
    --    _ = (u ^ 2 + 0 : ℝ) * Real.exp (-(u + 0)) := by norm_num
    --    _ = u ^ 2 * Real.exp (-(u + 0)) := by ring
    --    _ = u ^ 2 * Real.exp (-u) :=
    --      by
    --      have h₃ : Real.exp (-(u + 0)) = Real.exp (-u) := by simp [Real.exp_neg] <;> ring_nf <;> simp [Real.exp_neg]
    --      rw [h₃]
    --    _ = u ^ 2 * Real.exp (-u) := by rfl
    hole
  --  rw [h₂] <;> norm_num <;> ring_nf <;> simp [Real.exp_neg] <;> field_simp <;> ring <;> norm_num
  hole