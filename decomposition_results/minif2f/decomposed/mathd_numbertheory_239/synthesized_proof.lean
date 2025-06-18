theorem mathd_numbertheory_239 : (∑ k in Finset.Icc 1 12, k) % 4 = 2 := by
  have h_sum : (∑ k in Finset.Icc 1 12, k) = 78 := by
    norm_cast
  
  have h_final : (∑ k in Finset.Icc 1 12, k) % 4 = 2 := by
    norm_cast
  
  norm_cast
