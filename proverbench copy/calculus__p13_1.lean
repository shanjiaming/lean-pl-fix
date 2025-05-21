lemma value_at_pi_over_3 : f (π / 3) = 4 := by
  have h_cos : cos (π / 3) = 1 / 2 := by
    norm_num [Real.cos_pi_div_three]
    <;>
    ring_nf
    <;>
    norm_num
  
  have h_main : f (π / 3) = 4 := by
    rw [f]
    rw [h_cos]
    norm_num
    <;>
    ring_nf
    <;>
    norm_num
  
  exact h_main