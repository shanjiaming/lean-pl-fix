theorem putnam_1965_b1  : Tendsto
    (fun n =>
      ∫ (x : Fin (n + 1) → ℝ) in {x | ∀ (k : Fin (n + 1)), x k ∈ Set.Icc 0 1},
        Real.cos (Real.pi / (2 * (↑n + 1)) * ∑ k, x k) ^ 2)
    atTop (𝓝 (1 / 2)) :=
  by
  have h_main :
    ∀ (n : ℕ),
      (∫ (x : Fin (n + 1) → ℝ) in {x : Fin (n + 1) → ℝ | ∀ (k : Fin (n + 1)), x k ∈ Set.Icc 0 1},
          (Real.cos (Real.pi / (2 * (n + 1 : ℝ)) * ∑ k : Fin (n + 1), x k)) ^ 2) =
        (1 / 2 : ℝ)
  hole