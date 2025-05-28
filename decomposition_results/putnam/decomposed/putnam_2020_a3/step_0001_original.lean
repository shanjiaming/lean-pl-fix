theorem putnam_2020_a3 (a : ℕ → ℝ) (ha0 : a 0 = Real.pi / 2) (ha : ∀ n, a (n + 1) = Real.sin (a n)) :
  (∃ L, Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (a n) ^ 2) atTop (𝓝 L)) ↔ ((False) : Prop)