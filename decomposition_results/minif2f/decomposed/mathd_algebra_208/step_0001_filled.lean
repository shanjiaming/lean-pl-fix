theorem mathd_algebra_208  : √1000000 - 1000000 ^ (1 / 3) = 900 :=
  by
  have h_sqrt : Real.sqrt 1000000 = 1000 := by sorry
  have h_cbrt : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100 := by sorry
  have h_main : Real.sqrt 1000000 - (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 900 := by sorry
  --  rw [h_main] <;> norm_num
  hole