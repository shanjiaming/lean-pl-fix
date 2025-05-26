/-- Theorem: Given p_A = 0.3 and p_B = 0.4, the probability that shooter A
    is the first to hit the target in a sequential, independent shooting scenario is 15/29. -/
theorem prob_A_first_hit_value {α : Type} [MeasurableSpace α]
    (μ : Measure α) (A : Set α) (B : Set α)
  (hIndep : IndepSet A B μ) (hA : μ (A) = p_A) (hB : μ (B) = p_B) :
  prob_A_first_hit μ A B  = 15 / 29 :=