theorem prob_A_first_hit_value {α : Type} [MeasurableSpace α] (μ : Measure α) (A : Set α) (B : Set α)
  (hIndep : IndepSet A B μ) (hA : μ (A) = p_A) (hB : μ (B) = p_B) : prob_A_first_hit μ A B = 15 / 29:=
  by
  have h₁ : (μ (A)).toNNReal = p_A:= by rw [hA] <;> simp [p_A, ENNReal.toNNReal_eq_toReal] <;> norm_num <;> rfl
    hole
  have h₂ : (μ (B)).toNNReal = p_B:= by rw [hB] <;> simp [p_B, ENNReal.toNNReal_eq_toReal] <;> norm_num <;> rfl
    hole
  have h₃ : (1 : NNReal) - p_A = 7 / 10:= by
    rw [p_A] <;> norm_num [NNReal.coe_sub, NNReal.coe_one, NNReal.coe_div, NNReal.coe_mk, Nat.cast_ofNat] <;> rfl
    hole
  have h₄ : (1 : NNReal) - p_B = 6 / 10:= by
    rw [p_B] <;> norm_num [NNReal.coe_sub, NNReal.coe_one, NNReal.coe_div, NNReal.coe_mk, Nat.cast_ofNat] <;> rfl
    hole
  have h₅ : ((1 : NNReal) - p_A) * ((1 : NNReal) - p_B) = 21 / 50:= by
    rw [h₃, h₄] <;> norm_num [NNReal.coe_mul, NNReal.coe_div, NNReal.coe_mk, Nat.cast_ofNat] <;> rfl
    hole
  have h₆ : (1 : NNReal) - ((1 : NNReal) - p_A) * ((1 : NNReal) - p_B) = 29 / 50:= by
    rw [h₅] <;>
        norm_num [p_A, p_B, NNReal.coe_sub, NNReal.coe_mul, NNReal.coe_one, NNReal.coe_div, NNReal.coe_mk,
          Nat.cast_ofNat] <;>
      rfl
    hole
  have h₇ : p_A / ((1 : NNReal) - ((1 : NNReal) - p_A) * ((1 : NNReal) - p_B)) = 15 / 29:=
    by
    rw [h₆]
    rw [p_A] <;> norm_num [NNReal.coe_div, NNReal.coe_mk, Nat.cast_ofNat] <;> rfl
    hole
  have h₈ : prob_A_first_hit μ A B = 15 / 29:= by
    rw [prob_A_first_hit, h₁, h₂, h₆] <;> simp_all [h₇] <;> norm_num <;> rfl
    hole
  rw [h₈] <;> rfl
  hole