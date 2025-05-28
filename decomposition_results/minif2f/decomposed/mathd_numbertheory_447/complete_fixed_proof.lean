theorem mathd_numbertheory_447 : (∑ k in Finset.filter (fun x => 3 ∣ x) (Finset.Icc 1 49), k % 10) = 78:=
  by
  have h_main : (∑ k in Finset.filter (fun x => 3 ∣ x) (Finset.Icc 1 49), k % 10) = 78:= by
    --  norm_num [Finset.sum_filter, Finset.sum_Icc_succ_top, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt,
    --      Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt,
    --      Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt, Nat.div_eq_of_lt] <;>
      rfl
    hole
  --  exact h_main
  linarith