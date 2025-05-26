theorem h₃ (h₀ : HasDerivAt (fun x => 3 ^ x) (Real.log 3) 0) : sorry := by
  convert h₀.tendsto_slope using 1 <;> simp [sub_ne_zero] <;> simp_all [sub_ne_zero] <;> field_simp [sub_ne_zero] <;>
      ring_nf <;>
    norm_num