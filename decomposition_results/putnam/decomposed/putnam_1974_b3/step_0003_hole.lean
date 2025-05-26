theorem h₂ (α : ℝ) (ha : cos (π * α) = 1 / 3) (p q : ℤ) (hq : q > 0) (hα : α = (↑p : ℝ) / (↑q : ℝ)) (h₁ : cos (π * α) = 1 / 3) : cos (π * α) = cos ((↑p : ℝ) * π / (↑q : ℝ)) := by
  --  --  rw [hα] <;> field_simp [mul_comm] <;> ring_nf <;>
              field_simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub] <;>
            ring_nf <;>
          simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub] <;>
        field_simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub] <;>
      ring_nf <;>
    simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub]
  hole