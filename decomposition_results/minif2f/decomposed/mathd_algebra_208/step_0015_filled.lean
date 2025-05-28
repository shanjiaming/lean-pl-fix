theorem h_main (h_sqrt : √1000000 = 1000) (h_cbrt : 1000000 ^ (1 / 3) = 100) : √1000000 - 1000000 ^ (1 / 3) = 900 := by
  --  --  rw [h_sqrt] <;> simpa using h_cbrt <;> norm_num <;> linarith [Real.sqrt_nonneg 1000000]
  omega