/-- Theorem: The probability of A hitting first is greater than 1/2. -/
theorem A_hits_first_more_likely {α : Type} [MeasurableSpace α]
    (μ : Measure α) (A : Set α) (B : Set α)
    (hIndep : IndepSet A B μ) (hA : μ (A) = p_A) (hB : μ (B) = p_B) :
    prob_A_first_hit μ A B > 1 / 2 :=