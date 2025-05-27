theorem putnam_2007_b4
(n : ℕ) (npos : n > 0) :
({(P, Q) : (Polynomial ℝ) × (Polynomial ℝ) | P ^ 2 + Q ^ 2 = Polynomial.X ^ (2 * n) + 1 ∧ P.degree > Q.degree}.ncard = ((fun n ↦ 2 ^ (n + 1)) : ℕ → ℕ ) n) := by