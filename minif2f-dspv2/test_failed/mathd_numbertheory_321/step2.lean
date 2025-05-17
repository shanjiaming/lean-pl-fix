theorem h₂ (n : ZMod 1399) (h₁ : n = 160⁻¹) : n = 1058 := by
  rw [h₁]
  rw [show (160 : ZMod 1399)⁻¹ = 1058 by
        norm_num [ZMod.val_eq_zero, ZMod.val_one, ZMod.val_mul, ZMod.val_nat_cast, Nat.mod_eq_of_lt,
            Nat.div_eq_of_lt] <;>
          rfl] <;>
    rfl