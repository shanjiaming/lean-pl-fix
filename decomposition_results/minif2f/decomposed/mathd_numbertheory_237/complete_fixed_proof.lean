theorem mathd_numbertheory_237 : (∑ k in Finset.range 101, k) % 6 = 4:=
  by
  have h : (∑ k in Finset.range 101, k) = 5050:= by -- rfl
    norm_num
  have h₁ : (∑ k in Finset.range 101, k) % 6 = 4:= by -- rw [h] <;> norm_num <;> rfl
    norm_num
  --  apply h₁
  norm_num