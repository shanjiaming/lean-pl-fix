theorem h₁ (n : ℕ) : Tendsto (fun n => (2 / 3) ^ n) Filter.atTop (nhds 0) := by
  apply tendsto_pow_atTop_nhds_0_of_lt_1 <;> norm_num <;> simp_all <;> norm_num <;> linarith