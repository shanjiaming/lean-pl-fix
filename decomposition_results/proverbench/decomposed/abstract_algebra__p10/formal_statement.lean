theorem product_of_positive_reals_bound (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
  (h_sum : (a^2 / (1 + a^2)) + (b^2 / (1 + b^2)) + (c^2 / (1 + c^2)) = 1) :
  abs (a * b * c) ≤ 1 / (2 * Real.sqrt 2) :=