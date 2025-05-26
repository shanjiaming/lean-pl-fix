theorem averageVelocity : (heightFunction 2.5 - heightFunction 2) / (2.5 - 2) = -32:=
  by
  have h_denominator : (2.5 - 2 : ℝ) = 1 / 2:= by
    --  --  --  --  norm_num [heightFunction, heightAtTwo, heightAtTwoPointFive] <;> ring_nf at * <;> norm_num <;> linarith
    hole
  have h_numerator : (heightFunction 2.5 - heightFunction 2 : ℝ) = -16:=
    by
    have h₁ : heightFunction 2.5 = 0 := heightAtTwoPointFive
    have h₂ : heightFunction 2 = 16 := heightAtTwo
    --  rw [h₁, h₂] <;> norm_num <;> linarith
    hole
  have h_final : (heightFunction 2.5 - heightFunction 2) / (2.5 - 2) = -32:= by
    --  rw [h_numerator, h_denominator] <;> norm_num <;> linarith
    hole
  --  apply h_final
  hole