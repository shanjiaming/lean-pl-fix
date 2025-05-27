theorem putnam_2014_b3
(m n : ℕ)
(A : Matrix (Fin m) (Fin n) ℚ)
(mnpos : 0 < m ∧ 0 < n)
(Aprime : {p : ℕ | p.Prime ∧ ∃ (i : Fin m) (j : Fin n), |A i j| = p}.encard ≥ m + n)
: A.rank ≥ 2 := by