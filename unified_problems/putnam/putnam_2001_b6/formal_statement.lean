theorem putnam_2001_b6 :
  (∀ a : ℤ → ℝ,
    (∀ n ≥ 1, a n > 0 ∧ a n < a (n + 1)) →
    (Tendsto (fun n : ℤ => a (n + 1) / (n + 1)) atTop (𝓝 0)) →
    {n : ℤ | n > 0 ∧ (∀ i ∈ Set.Icc 1 (n - 1), a (n - i) + a (n + i) < 2 * a n)}.Infinite)
  ↔ ((True) : Prop ) := by