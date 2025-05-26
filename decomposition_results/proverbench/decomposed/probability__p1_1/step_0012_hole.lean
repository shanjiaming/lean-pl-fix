theorem h₆ (h : 1 - rexp (-1) = 1 - rexp (-sorry)) (h₁ : rexp (-sorry) = rexp (-1)) (h₂ : -sorry = -1) (h₃ : sorry = 1) (h₅ : sorry = 1) : sorry = 1 := by
  --  apply NNReal.eq
  norm_num at h₅ ⊢ <;> simp_all [NNReal.coe_eq_one] <;> linarith
  hole