theorem putnam_1994_b2
  (c : ℝ) :
  (∃ m b : ℝ,
    {x : ℝ | m * x + b = x ^ 4 + 9 * x ^ 3 + c * x ^ 2 + 9 * x + 4}.encard = 4)
  ↔ c ∈ (({c : ℝ | c < 243 / 8}) : Set ℝ ) := by