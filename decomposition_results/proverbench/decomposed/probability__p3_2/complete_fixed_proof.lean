theorem A_hits_first_more_likely {α : Type} [MeasurableSpace α] (μ : Measure α) (A : Set α) (B : Set α)
  (hIndep : IndepSet A B μ) (hA : μ (A) = p_A) (hB : μ (B) = p_B) : prob_A_first_hit μ A B > 1 / 2:=
  by
  have h₁ : prob_A_first_hit μ A B = 15 / 29:=
    by
    have h₂ : prob_A_first_hit μ A B = 15 / 29:= by apply prob_A_first_hit_value <;> assumption
      hole
    rw [h₂] <;> norm_num
    hole
  have h₂ : (15 : NNReal) / 29 > 1 / 2:= by norm_num [div_lt_div_iff, NNReal.coe_lt_coe] <;> aesop
    hole
  have h₃ : prob_A_first_hit μ A B > 1 / 2:= by
    rw [h₁]
    exact h₂
    hole
  exact h₃
  hole