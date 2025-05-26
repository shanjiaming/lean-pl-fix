theorem limit_of_function_as_x_approaches_zero : Tendsto (fun x => (3 ^ x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)):=
  by
  have h₀ : HasDerivAt (fun x : ℝ => (3 : ℝ) ^ x) (Real.log 3) 0:=
    by
    have h₁ : HasDerivAt (fun x : ℝ => (3 : ℝ) ^ x) (Real.log 3 * (3 : ℝ) ^ (0 : ℝ)) 0:= by
      --  convert HasDerivAt.rpow (hasDerivAt_const (0 : ℝ) (3 : ℝ)) (hasDerivAt_id (0 : ℝ)) (by norm_num) using 1 <;>
      --              simp [Real.log_pow, Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm] <;>
      --            ring_nf <;>
      --          norm_num <;>
      --        field_simp [Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm] <;>
          ring_nf <;>
        norm_num
      hole
    --  --  --  convert h₁ using 1 <;> norm_num <;> simp [Real.log_pow, Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm] <;>
        ring_nf <;>
      norm_num
    hole
  have h₁ : Tendsto (fun x => (3 ^ x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)):=
    by
    have h₂ : Tendsto (fun x => ((3 : ℝ) ^ x - (3 : ℝ) ^ (0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)):=
      by
      have h₃ : Tendsto (fun x => ((3 : ℝ) ^ x - (3 : ℝ) ^ (0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)):= by
        --  convert h₀.tendsto_slope using 1 <;> simp [sub_ne_zero] <;> simp_all [sub_ne_zero] <;> field_simp [sub_ne_zero] <;>
            ring_nf <;>
          norm_num
        hole
      --  exact h₃
      hole
    have h₄ : Tendsto (fun x => (3 ^ x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)):= by
      --  convert h₂ using 1 <;> simp [sub_ne_zero] <;> field_simp [sub_ne_zero] <;> ring_nf <;> norm_num
      hole
    --  exact h₄
    hole
  --  exact h₁
  hole