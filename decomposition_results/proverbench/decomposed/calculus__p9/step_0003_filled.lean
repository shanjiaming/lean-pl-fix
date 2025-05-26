theorem h2 (x : ℝ) : ∫ (x : ℝ), sin x ^ 3 * cos x ^ 6 = ∫ (x : ℝ), sin x * cos x ^ 6 - sin x * cos x ^ 8 :=
  by
  --  congr
  --  funext x
  have h3 : Real.sin x ^ 3 = Real.sin x * (1 - Real.cos x ^ 2) := by sorry
  --  --  rw [h3] <;> ring <;> simp [mul_assoc, pow_add, pow_mul, mul_assoc] <;> ring <;> simp [Real.sin_sq, Real.cos_sq] <;>
            ring <;>
          simp [mul_assoc, pow_add, pow_mul, mul_assoc] <;>
        ring <;>
      simp [Real.sin_sq, Real.cos_sq] <;>
    ring
  hole