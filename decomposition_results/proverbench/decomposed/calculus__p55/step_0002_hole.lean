theorem h₁  : sorry = 512 :=
  by
  have h₂ : h 2 5 (-6) 3 = (2 : ℝ) ^ (5 * 3 + (-6)) := by sorry
  --  rw [h₂]
  norm_num [Real.rpow_nat_cast, pow_succ] <;> norm_num <;> rfl
  hole