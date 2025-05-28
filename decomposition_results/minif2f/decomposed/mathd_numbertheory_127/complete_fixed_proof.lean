theorem mathd_numbertheory_127 : (∑ k in Finset.range 101, 2 ^ k) % 7 = 3:=
  by
  have h_sum_mod : (∑ k in Finset.range 101, 2 ^ k) % 7 = 3:= by -- rfl
    norm_num
  --  exact h_sum_mod
  norm_num