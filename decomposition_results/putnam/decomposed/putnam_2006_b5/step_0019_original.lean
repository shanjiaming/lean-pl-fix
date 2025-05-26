theorem h₁₈ (I J : (ℝ → ℝ) → ℝ) (hI : (fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) = fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) (hJ : (fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) = fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) (h₁ :  1 / 16 ∈    {y |      ∃ f,        ContinuousOn f sorry ∧          (fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) f - (fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) f = y}) (y : ℝ) (f : ℝ → ℝ) (hf_cont : ContinuousOn f sorry) (hf h₃ : (fun f => ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) f - (fun f => ∫ (x : ℝ) in 0 ..1, x * f x ^ 2) f = y) (h₆ : ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x - x * f x ^ 2 ≤ 1 / 16) : ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x - x * f x ^ 2 = (∫ (x : ℝ) in 0 ..1, x ^ 2 * f x) - ∫ (x : ℝ) in 0 ..1, x * f x ^ 2 :=
  by
  rw [intervalIntegral.integral_sub]
  · apply Continuous.intervalIntegrable
    have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by sorry
    exact h₂₀.continuousOn
    apply Continuous.intervalIntegrable
    have h₂₁ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
      exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
    exact h₂₁.continuousOn
  · apply Continuous.intervalIntegrable
    have h₂₀ : ContinuousOn (fun x : ℝ => x ^ 2 * f x) (Set.Icc 0 1) := by sorry
    exact h₂₀.continuousOn
    apply Continuous.intervalIntegrable
    have h₂₁ : ContinuousOn (fun x : ℝ => x * (f x) ^ 2) (Set.Icc 0 1) := by
      exact ContinuousOn.mul continuousOn_id (ContinuousOn.pow hf_cont 2)
    exact h₂₁.continuousOn