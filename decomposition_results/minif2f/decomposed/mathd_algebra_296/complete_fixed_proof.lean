theorem mathd_algebra_296 : abs ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = 3600:=
  by
  have h₁ : (3491 - 60 : ℕ) = 3431:= by -- norm_num <;> rfl
    norm_num
  have h₂ : (3491 + 60 : ℕ) = 3551:= by -- norm_num <;> rfl
    norm_num
  have h₃ : (3431 : ℕ) * 3551 = 12183481:= by -- norm_num <;> rfl
    norm_num
  have h₄ : (3491 : ℕ) ^ 2 = 12187081:= by -- norm_num [pow_two] <;> rfl
    norm_num
  have h₅ : ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = -3600:=
    by
    have h₅₁ : ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = -3600:= by
      --  norm_num [h₁, h₂, h₃, h₄, pow_two, Int.mul_emod, Int.add_emod, Int.sub_emod] <;> rfl
      norm_num
    --  rw [h₅₁] <;> rfl
    norm_num
  have h₆ : abs ((3491 - 60) * (3491 + 60) - 3491 ^ 2 : ℤ) = 3600:= by
    --  rw [h₅] <;> norm_num [abs_of_nonpos, abs_of_nonneg] <;> rfl
    hole
  --  apply h₆
  hole