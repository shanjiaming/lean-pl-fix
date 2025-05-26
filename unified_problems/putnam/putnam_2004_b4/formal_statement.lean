theorem putnam_2004_b4
(n : ℕ)
(nge2 : n ≥ 2)
(R Rk : ℕ → ℂ → ℂ)
(hR : R 0 = id ∧ ∀ k : ℕ, R (k + 1) = Rk (k + 1) ∘ R k)
(hRk : Rk = fun (k : ℕ) (Q : ℂ) ↦ k + Complex.exp (Complex.I * 2 * Real.pi / n) * (Q - k))
: (R n = ((fun n z ↦ z + n) : ℕ → ℂ → ℂ ) n) := by