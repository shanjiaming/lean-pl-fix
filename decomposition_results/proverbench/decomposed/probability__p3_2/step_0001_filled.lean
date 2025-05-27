theorem A_hits_first_more_likely (α : Type) (inst✝ : MeasurableSpace α) (μ : Measure α) (A B : Set α) (hIndep : IndepSet A B μ) (hA : μ A = ↑p_A) (hB : μ B = ↑p_B) : prob_A_first_hit μ A B > 1 / 2 :=
  by
  have h₁ : prob_A_first_hit μ A B = 15 / 29 := by sorry
  have h₂ : (15 : NNReal) / 29 > 1 / 2 := by sorry
  have h₃ : prob_A_first_hit μ A B > 1 / 2 := by sorry
  exact h₃
  hole