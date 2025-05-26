theorem putnam_1975_a4
(m : ℕ)
(hm : Odd m ∧ m > 1)
(θ : ℂ)
(hθ : θ = cexp (2 * Real.pi * I / (2 * m)))
: 1/(1 - θ) = Polynomial.aeval θ (((fun m => ∑ j in Finset.range ((m - 1) / 2), Polynomial.X ^ (2 * j + 1)) : ℕ → Polynomial ℤ ) m) := by