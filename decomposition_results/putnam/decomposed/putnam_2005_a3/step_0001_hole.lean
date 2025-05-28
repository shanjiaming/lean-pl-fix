theorem putnam_2005_a3 (p : Polynomial ℂ) (n : ℕ) (hn : 0 < n) (g : ℂ → ℂ) (pdeg : p.degree = ↑n) (pzeros : ∀ (z : ℂ), Polynomial.eval z p = 0 → z.abs = 1) (hg : ∀ (z : ℂ), g z = Polynomial.eval z p / z ^ (↑n / 2)) (z : ℂ) (hz : z ≠ 0 ∧ deriv g z = 0) : z.abs = 1 :=
  by
  have h₀ : p.eval z = 0 → Complex.abs z = 1 := by sorry
  have h₁ : p.eval z = 0 → Complex.abs z = 1 := h₀
  --  by_cases h₂ : p.eval z = 0
  --  · exact h₁ h₂
  ·
    have h₃ : False := by sorry
  --    exfalso
  --    exact h₃
  hole