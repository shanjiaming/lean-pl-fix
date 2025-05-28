theorem h₆ (h_sqrt : √1000000 = 1000) (h₁ : Real.log (1000000 ^ (1 / 3)) = Real.log 100) (h₂ : 1000000 ^ (1 / 3) > 0) (h₃ : 100 > 0) (h₄ h₅ : Real.log (1000000 ^ (1 / 3)) = Real.log 100) : 1000000 ^ (1 / 3) = 100 := by
  --  apply Real.log_injOn_pos (Set.mem_Ioi.mpr h₂) (Set.mem_Ioi.mpr (by norm_num [h₃])) <;>
          simp_all [Real.log_rpow, Real.log_pow] <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith
  hole