theorem mathd_numbertheory_239 : (∑ k in Finset.Icc 1 12, k) % 4 = 2:=
  by
  have h_sum : (∑ k in Finset.Icc 1 12, k) = 78:= by -- norm_num [Finset.sum_Icc_succ_top, Nat.div_eq_of_lt] <;> rfl
    norm_cast
  have h_final : (∑ k in Finset.Icc 1 12, k) % 4 = 2:= by -- rw [h_sum] <;> norm_num <;> rfl
    omega
  --  apply h_final
  linarith