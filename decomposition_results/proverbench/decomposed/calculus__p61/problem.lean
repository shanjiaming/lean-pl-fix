theorem limit_of_function_as_x_approaches_zero :
  Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
  have h₀ : HasDerivAt (fun x : ℝ => (3 : ℝ)^x) (Real.log 3) 0 := by
    -- Prove that the derivative of `fun x => (3 : ℝ)^x` at `0` is `Real.log 3`
    have h₁ : HasDerivAt (fun x : ℝ => (3 : ℝ) ^ x) (Real.log 3 * (3 : ℝ) ^ (0 : ℝ)) 0 := by
      -- Use the fact that `(3 : ℝ)^x = exp (log 3 * x)` and compute its derivative
      convert HasDerivAt.rpow (hasDerivAt_const (0 : ℝ) (3 : ℝ)) (hasDerivAt_id (0 : ℝ)) (by norm_num) using 1 <;>
        simp [Real.log_pow, Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm]
      <;> ring_nf
      <;> norm_num
      <;> field_simp [Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm]
      <;> ring_nf
      <;> norm_num
    -- Simplify the expression to get the final result
    convert h₁ using 1 <;> norm_num
    <;> simp [Real.log_pow, Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm]
    <;> ring_nf
    <;> norm_num
  
  have h₁ : Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
    -- Use the fact that the derivative of `fun x => (3 : ℝ)^x` at `0` is `Real.log 3` to get the limit statement for `(3^x - 1)/x`
    have h₂ : Tendsto (fun x => ((3 : ℝ)^x - (3 : ℝ)^(0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
      -- Use `HasDerivAt.tendsto_slope` to get the limit statement for `(3^x - 1)/x`
      have h₃ : Tendsto (fun x => ((3 : ℝ)^x - (3 : ℝ)^(0 : ℝ)) / (x - 0)) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
        convert h₀.tendsto_slope using 1 <;> simp [sub_ne_zero]
        <;> simp_all [sub_ne_zero]
        <;> field_simp [sub_ne_zero]
        <;> ring_nf
        <;> norm_num
      exact h₃
    -- Simplify the expression to get the final result
    have h₄ : Tendsto (fun x => (3^x - 1) / x) (𝓝[≠] 0) (𝓝 (Real.log 3)) := by
      convert h₂ using 1
      <;> simp [sub_ne_zero]
      <;> field_simp [sub_ne_zero]
      <;> ring_nf
      <;> norm_num
    exact h₄
  
  exact h₁