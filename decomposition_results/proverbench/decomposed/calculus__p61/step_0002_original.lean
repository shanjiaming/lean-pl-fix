theorem h₀  : HasDerivAt (fun x => 3 ^ x) (Real.log 3) 0 :=
  by
  have h₁ : HasDerivAt (fun x : ℝ => (3 : ℝ) ^ x) (Real.log 3 * (3 : ℝ) ^ (0 : ℝ)) 0 := by sorry
  convert h₁ using 1 <;> norm_num <;> simp [Real.log_pow, Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm] <;>
      ring_nf <;>
    norm_num