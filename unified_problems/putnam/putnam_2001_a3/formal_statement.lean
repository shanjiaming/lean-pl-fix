theorem putnam_2001_a3
(P : ℤ → Polynomial ℤ)
(hP : P = fun m : ℤ => (Polynomial.X)^4 - (Polynomial.C (2*m + 4))*(Polynomial.X)^2 + Polynomial.C ((m - 2)^2))
: {m : ℤ | ∃ a b, P m = a * b ∧
(∃ n ∈ Ici 1, a.coeff n ≠ 0) ∧ (∃ n ∈ Ici 1, b.coeff n ≠ 0)} = (({m : ℤ | ∃ k : ℤ, k^2 = m ∨ 2*k^2 = m}) : Set ℤ ) := by