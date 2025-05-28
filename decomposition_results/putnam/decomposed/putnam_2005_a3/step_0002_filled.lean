theorem h₀ (p : Polynomial ℂ) (n : ℕ) (hn : 0 < n) (g : ℂ → ℂ) (pdeg : p.degree = ↑n) (pzeros : ∀ (z : ℂ), Polynomial.eval z p = 0 → z.abs = 1) (hg : ∀ (z : ℂ), g z = Polynomial.eval z p / z ^ (↑n / 2)) (z : ℂ) (hz : z ≠ 0 ∧ deriv g z = 0) : Polynomial.eval z p = 0 → z.abs = 1 := by
  --  intro h
  --  exact pzeros z h
  hole