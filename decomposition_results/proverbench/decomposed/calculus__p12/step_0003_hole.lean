theorem h₃ (x : ℝ) (hx : x ≠ 3 ∧ x ≠ -3) (h₁ : x ≠ 3) (h₂ : x ≠ -3) : x = 3 ∨ x = -3 := by
  --  apply or_iff_not_imp_left.mpr
  --  intro h₄
  --  apply eq_of_sub_eq_zero
  --  apply mul_left_cancel₀ (sub_ne_zero.mpr h₄)
  --  apply mul_left_cancel₀ (sub_ne_zero.mpr h₂)
  --  --  --  ring_nf at h₁ h₂ ⊢ <;> (try norm_num) <;> (try linarith)
  hole