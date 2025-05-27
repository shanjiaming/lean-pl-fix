theorem h₄ (α : Type) (inst✝ : MeasurableSpace α) (μ : Measure α) (A B : Set α) (hIndep : IndepSet A B μ) (hA : μ A = ↑p_A) (hB : μ B = ↑p_B) (h₁ : (μ A).toNNReal = p_A) (h₂ : (μ B).toNNReal = p_B) (h₃ : 1 - p_A = 7 / 10) : 1 - p_B = 6 / 10 := by
  rw [p_B] <;> norm_num [NNReal.coe_sub, NNReal.coe_one, NNReal.coe_div, NNReal.coe_mk, Nat.cast_ofNat] <;> rfl
  hole