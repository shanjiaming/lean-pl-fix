theorem h_main (h_cos : cos (π / 3) = 1 / 2) : sorry = 4 := by
  --  rw [f]
  rw [h_cos]
  norm_num <;> ring_nf <;> norm_num
  hole