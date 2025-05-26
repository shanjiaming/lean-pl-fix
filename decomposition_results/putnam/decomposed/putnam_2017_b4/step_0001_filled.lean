theorem putnam_2017_b4  : ∑' (k : ℕ),
      (3 * Real.log (4 * (↑k : ℝ) + 2) / (4 * (↑k : ℝ) + 2) - Real.log (4 * (↑k : ℝ) + 3) / (4 * (↑k : ℝ) + 3) -
          Real.log (4 * (↑k : ℝ) + 4) / (4 * (↑k : ℝ) + 4) -
        Real.log (4 * (↑k : ℝ) + 5) / (4 * (↑k : ℝ) + 5)) =
    Real.log 2 ^ 2 :=
  by
  have h_main :
    (∑' k : ℕ,
        (3 * Real.log (4 * k + 2) / (4 * k + 2) - Real.log (4 * k + 3) / (4 * k + 3) -
            Real.log (4 * k + 4) / (4 * k + 4) -
          Real.log (4 * k + 5) / (4 * k + 5))) =
      (Real.log 2) ^ 2 := by sorry
  --  exact h_main
  linarith