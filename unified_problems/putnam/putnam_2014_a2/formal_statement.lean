theorem putnam_2014_a2
(n : ℕ)
(A : Matrix (Fin n) (Fin n) ℝ)
(npos : n > 0)
(hA : ∀ i j : Fin n, A i j = 1 / min (i.1 + 1 : ℚ) (j.1 + 1))
: A.det = ((fun n : ℕ => (-1) ^ (n - 1) / ((n - 1)! * (n)!)) : ℕ → ℝ ) n := by