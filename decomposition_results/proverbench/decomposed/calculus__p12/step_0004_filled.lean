theorem h₂ (x : ℝ) (hx : x ≠ 3 ∧ x ≠ -3) (h : False) : ∫ (dx : ℝ), 1 / (x ^ 2 - 9) = 1 / 6 * log |(x - 3) / (x + 3)| + sorry :=
  by
  --  exfalso
  --  exact h
  norm_cast