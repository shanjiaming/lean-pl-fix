theorem modular_arithmetic : (-3 : ZMod 8) = 5 := by
  have h : (-3 : ZMod 8) = 5 := by
    norm_num [ZMod.nat_cast_self]
    <;> rfl
  
  exact h