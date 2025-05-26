theorem putnam_1997_b1
(F : ℕ → ℝ)
(hF : F = fun (n : ℕ) => ∑ m in Finset.Icc 1 (6 * n - 1), min (dist_to_int (m/(6*n)) ) (dist_to_int (m/(3*n))))
: ∀ n, n > 0 → F n = ((fun n => n) : ℕ → ℝ ) n := by