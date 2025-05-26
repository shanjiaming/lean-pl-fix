theorem putnam_1999_b5
  (n : ℕ)
  (hn : n ≥ 3)
  (theta : ℝ)
  (htheta : theta = 2 * Real.pi / n)
  (A : Matrix (Fin n) (Fin n) ℝ)
  (hA : A = fun j k => Real.cos ((j.1 + 1) * theta + (k.1 + 1) * theta)) :
  (1 + A).det = ((fun n => 1 - n^2/4) : ℕ → ℝ ) n := by