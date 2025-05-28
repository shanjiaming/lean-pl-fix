theorem h₂ (α : ℝ) (ha : Real.cos (Real.pi * α) = 1 / 3) (p q : ℤ) (hq : q > 0) (hα : α = ↑p / ↑q) (h₁ : Real.cos (Real.pi * α) = 1 / 3) : Real.cos (Real.pi * α) = Real.cos (↑p * Real.pi / ↑q) := by
  --  --  rw [hα] <;> field_simp [mul_comm] <;> ring_nf <;>
              field_simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub] <;>
            ring_nf <;>
          simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub] <;>
        field_simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub] <;>
      ring_nf <;>
    simp [Real.cos_add, Real.cos_sub, Real.sin_add, Real.sin_sub]
  hole