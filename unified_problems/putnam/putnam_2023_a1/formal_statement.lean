theorem putnam_2023_a1
  (f : ℕ → ℝ → ℝ)
  (hf : ∀ n > 0, f n = fun x : ℝ => ∏ i in Finset.Icc 1 n, Real.cos (i * x)) :
  IsLeast {n | 0 < n ∧ |iteratedDeriv 2 (f n) 0| > 2023} ((18) : ℕ ) := by