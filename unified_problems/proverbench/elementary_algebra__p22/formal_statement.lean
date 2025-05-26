theorem inequality_for_positive_reals (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
  2 * a^3 + 2 * b^3 + 2 * c^3 + a^2 * b + b^2 * c + c^2 * a ≥ 3 * a * b^2 + 3 * b * c^2 + 3 * c * a^2 :=