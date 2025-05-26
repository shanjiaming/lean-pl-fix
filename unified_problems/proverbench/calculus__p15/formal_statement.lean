/-- Version 1: Using explicit domain restriction -/
theorem limit_of_cosine_difference_quotient :
  ¬ (Tendsto (fun x => if x ≠ 0 then (1 - Real.cos x) / x^2 else 1/2) (𝓝 0) (𝓝 (1/2)) ) :=