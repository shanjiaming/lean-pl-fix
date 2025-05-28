theorem h₁ (x z : ℝ) (P : ℕ → ℝ) (xlt1 : |x| < 1) (zgt1 : |z| > 1) (hP : ∀ j ≥ 1, P j = (∏ i, (1 - z * x ^ ↑i)) / ∏ i, (z - x ^ ↑i)) : ∀ n ≥ 1, P n = (∏ i, (1 - z * x ^ ↑i)) / ∏ i, (z - x ^ ↑i) :=
  by
  --  intro n hn
  --  exact hP n hn
  hole