theorem h₅₁ (h₁ : 3491 - 60 = 3431) (h₂ : 3491 + 60 = 3551) (h₃ : 3431 * 3551 = 12183481) (h₄ : 3491 ^ 2 = 12187081) : (3491 - 60) * (3491 + 60) - 3491 ^ 2 = -3600 := by
  --  norm_num [h₁, h₂, h₃, h₄, pow_two, Int.mul_emod, Int.add_emod, Int.sub_emod] <;> rfl
  hole