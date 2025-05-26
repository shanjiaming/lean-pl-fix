theorem h₅ (f : ℝ → ℝ := fun x => (8 * x ^ 2 + 6 * x + 5) / (x ^ 2 + 2 * x + 2)) (h₂ : ∫ (x : ℝ) in Set.Icc 0 1, f x = ∫ (x : ℝ) in Set.Icc 0 1, 8 + (-10 * x + -11) / (x ^ 2 + 2 * x + 2)) : ∫ (x : ℝ) in Set.Icc 0 1, 8 + (-10 * x + -11) / (x ^ 2 + 2 * x + 2) =
    (∫ (x : ℕ) in Set.Icc 0 1, 8) + ∫ (x : ℝ) in Set.Icc 0 1, (-10 * x + -11) / (x ^ 2 + 2 * x + 2) :=
  by
  --  apply intervalIntegral.integral_add
  · apply Continuous.intervalIntegrable
    continuity
  · apply Continuous.intervalIntegrable
    continuity
  hole