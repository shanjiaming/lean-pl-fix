theorem h₇₁ (α : ℝ) (f : ℝ → ℝ) (hf :  f ∈    {f |      (∀ x ∈ Icc 0 1, f x > 0) ∧        ContinuousOn f (Icc 0 1) ∧          ∫ (x : ℝ) in 0 ..1, f x = 1 ∧ ∫ (x : ℝ) in 0 ..1, x * f x = α ∧ ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2}) (h₁ : ∀ x ∈ Icc 0 1, f x > 0) (h₂ : ContinuousOn f (Icc 0 1)) (h₃ : ∫ (x : ℝ) in 0 ..1, f x = 1) (h₄ : ∫ (x : ℝ) in 0 ..1, x * f x = α) (h₅ : ∫ (x : ℝ) in 0 ..1, x ^ 2 * f x = α ^ 2) (h₆ : ∫ (x : ℝ) in 0 ..1, (x - α) ^ 2 * f x = 0) : ContinuousOn (fun x => (x - α) ^ 2 * f x) (Icc 0 1) :=
  by
  apply ContinuousOn.mul
  · exact ContinuousOn.pow (ContinuousOn.sub continuousOn_id continuousOn_const) 2
  · exact h₂