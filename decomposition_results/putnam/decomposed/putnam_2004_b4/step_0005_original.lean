theorem h₃ (n : ℕ) (nge2 : n ≥ 2) (R Rk : ℕ → ℂ → ℂ) (hR : R 0 = id ∧ ∀ (k : ℕ), R (k + 1) = Rk (k + 1) ∘ R k) (hRk : Rk = fun k Q => (↑k : ℂ) + Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) * (Q - (↑k : ℂ))) (h₁ : Complex.exp (Complex.I * 2 * (↑π : ℂ) / (↑n : ℂ)) ^ n = Complex.exp (Complex.I * 2 * (↑π : ℂ))) : Complex.exp (Complex.I * 2 * (↑π : ℂ)) = 1 :=
  by
  rw [Complex.exp_eq_one_iff]
  use 1 <;> ring_nf <;> simp [Complex.ext_iff, Complex.I_mul_I] <;> norm_num