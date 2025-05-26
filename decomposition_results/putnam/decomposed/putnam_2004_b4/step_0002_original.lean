theorem hω (n : ℕ) (nge2 : n ≥ 2) (R Rk : ℕ → ℂ → ℂ) (hR : R 0 = id ∧ ∀ (k : ℕ), R (k + 1) = Rk (k + 1) ∘ R k) (hRk : Rk = fun k Q => (↑k : ℂ) + Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) * (Q - (↑k : ℂ))) : Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) ^ n = 1 :=
  by
  have h₁ : Complex.exp (Complex.I * 2 * Real.pi / n) ^ n = Complex.exp (Complex.I * 2 * Real.pi) := by sorry
  rw [h₁]
  have h₃ : Complex.exp (Complex.I * 2 * Real.pi) = 1 := by sorry
  rw [h₃] <;> simp [Complex.ext_iff, Complex.I_mul_I] <;> norm_num