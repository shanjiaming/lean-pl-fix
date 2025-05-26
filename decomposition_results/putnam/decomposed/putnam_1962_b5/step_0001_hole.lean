theorem putnam_1962_b5 (n : ℤ) (ng1 : n > 1) : (3 * (↑n : ℝ) + 1) / (2 * (↑n : ℝ) + 2) < ∑ i, ((↑(↑i : ℤ) : ℝ) / (↑n : ℝ)) ^ (↑n : ℝ) ∧
    ∑ i, ((↑(↑i : ℤ) : ℝ) / (↑n : ℝ)) ^ (↑n : ℝ) < 2 :=
  by
  have h_main :
    (3 * (n : ℝ) + 1) / (2 * n + 2) < ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) ∧
      ∑ i : Finset.Icc 1 n, ((i : ℝ) / n) ^ (n : ℝ) < 2 := by sorry
  --  exact h_main
  hole