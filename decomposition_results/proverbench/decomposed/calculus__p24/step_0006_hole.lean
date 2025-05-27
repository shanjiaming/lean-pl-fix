theorem h₃ (h₂ : Tendsto (fun x => x ^ 3) atTop atTop) : Tendsto (fun x => 3 * x ^ 3) atTop atTop := by
  simpa using Tendsto.const_mul_atTop (by norm_num) h₂
  hole