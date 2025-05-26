theorem h₂ (h₁ : cos (π / 3) = 1 / 2) : tan (π / 3) = √3 :=
  by
  --  rw [Real.tan_eq_sin_div_cos]
  have h₃ : Real.sin (Real.pi / 3) = Real.sqrt 3 / 2 := by sorry
  --  --  rw [h₃, h₁] <;> ring_nf <;> field_simp [Real.sqrt_eq_iff_sq_eq] <;> ring_nf <;> norm_num [Real.sqrt_eq_iff_sq_eq] <;>
    linarith [Real.sqrt_nonneg 3]
  hole