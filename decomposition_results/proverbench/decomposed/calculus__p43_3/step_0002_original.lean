theorem h_denominator  : 2.5 - 2 = 1 / 2 := by
  norm_num [heightFunction, heightAtTwo, heightAtTwoPointFive] <;> ring_nf at * <;> norm_num <;> linarith