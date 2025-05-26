theorem perfect_square_condition {m : ℤ} (h : m = 2 + 2 * Real.sqrt (28 * n^2 + 1))
  (h_int : ∃ k : ℤ, Real.sqrt (28 * n^2 + 1) = k) :
  ∃ k : ℤ, m = k^2 :=