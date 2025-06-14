theorem mathd_numbertheory_3 : (∑ x in Finset.range 10, (x + 1) ^ 2) % 10 = 5 := by
  have h_sum : (∑ x in Finset.range 10, (x + 1) ^ 2) % 10 = 5 := by
    norm_num
    <;> rfl
  
  norm_num