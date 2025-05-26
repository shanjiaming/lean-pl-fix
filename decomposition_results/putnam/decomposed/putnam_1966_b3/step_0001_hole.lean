theorem putnam_1966_b3 (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (hconv : ∃ r, sorry) : ∃ r, sorry :=
  by
  have h_main :
    ∃ (r : ℝ),
      Tendsto (fun m : ℕ => ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) atTop (𝓝 r) := by sorry
  --  exact h_main
  hole