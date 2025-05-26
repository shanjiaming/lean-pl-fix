theorem putnam_2015_b6
    (A : ℕ → ℕ)
    (hA : ∀ k > 0, A k = {j : ℕ | Odd j ∧ j ∣ k ∧ j < Real.sqrt (2 * k)}.encard) :
    Tendsto (fun K : ℕ ↦ ∑ k in Finset.Icc 1 K, (-1 : ℝ) ^ ((k : ℝ) - 1) * (A k / (k : ℝ)))
      atTop (𝓝 ((Real.pi ^ 2 / 16) : ℝ )) :=
  by