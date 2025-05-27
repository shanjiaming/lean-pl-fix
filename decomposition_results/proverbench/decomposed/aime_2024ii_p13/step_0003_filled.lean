theorem h₂ (ω : ℂ) (h₀ : ω = Complex.exp (2 * ↑π * Complex.I / 13)) (h₁ : False) : (∏ k ∈ Finset.range 13, (2 - 2 * ω ^ k + ω ^ (2 * k))) % 1000 = 321 :=
  by
  --  exfalso
  --  exact h₁
  norm_cast