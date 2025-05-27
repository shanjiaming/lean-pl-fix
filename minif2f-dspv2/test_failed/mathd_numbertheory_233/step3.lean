theorem h₂ (b : ZMod (11 ^ 2)) (h₀ : b = 24⁻¹) (h₁ : 24 * 116 = 1) : 24⁻¹ = 116 := by
  apply Eq.symm
  apply Eq.symm
  rw [← mul_one (116 : ZMod (11 ^ 2)), ← h₁]
  simp [mul_assoc, mul_comm, mul_left_comm, inv_mul_cancel_left] <;> norm_num <;> rfl