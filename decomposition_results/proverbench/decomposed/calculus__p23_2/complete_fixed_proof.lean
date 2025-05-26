theorem geometric_limit : Tendsto (λ n : ℕ => (2 / 3 : ℝ) ^ n) Filter.atTop (nhds 0):=
  by
  have h₁ : Tendsto (λ n : ℕ => (2 / 3 : ℝ) ^ n) Filter.atTop (nhds 0):= by
    --  apply tendsto_pow_atTop_nhds_0_of_lt_1 <;> norm_num <;> simp_all <;> norm_num <;> linarith
    hole
  --  exact h₁
  hole