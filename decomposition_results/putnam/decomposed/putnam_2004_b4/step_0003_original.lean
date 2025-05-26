theorem h₁ (n : ℕ) (nge2 : n ≥ 2) (R Rk : ℕ → ℂ → ℂ) (hR : R 0 = id ∧ ∀ (k : ℕ), R (k + 1) = Rk (k + 1) ∘ R k) (hRk : Rk = fun k Q => (↑k : ℂ) + Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) * (Q - (↑k : ℂ))) : Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) ^ n = Complex.exp (Complex.I * 2 * (↑π : ℂ)) :=
  by
  have h₂ : (Complex.exp (Complex.I * 2 * Real.pi / n)) ^ n = Complex.exp (Complex.I * 2 * Real.pi) := by sorry
  exact h₂