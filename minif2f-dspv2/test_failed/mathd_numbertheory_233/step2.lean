theorem h₁ (b : ZMod (11 ^ 2)) (h₀ : b = 24⁻¹) : 24 * 116 = 1 := by
  norm_num [ZMod.val_mul, ZMod.val_nat_cast, ZMod.val_one, pow_succ] <;> rfl