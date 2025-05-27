theorem h₆ (lambda : NNReal) (h : 1 - rexp (-1) = 1 - rexp (-↑lambda)) (h₁ : rexp (-↑lambda) = rexp (-1)) (h₂ : -↑lambda = -1) (h₃ h₅ : ↑lambda = 1) : lambda = 1 := by
  --  apply NNReal.eq
  --  --  norm_num at h₅ ⊢ <;> simp_all [NNReal.coe_eq_one] <;> linarith
  hole