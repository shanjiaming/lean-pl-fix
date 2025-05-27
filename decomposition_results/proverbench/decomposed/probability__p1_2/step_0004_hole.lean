theorem h₂ (lambda : NNReal) (h₀ : poisson_pmf lambda 0 = rexp (-↑lambda)) (h₁ : poisson_pmf lambda 1 = rexp (-↑lambda)) : poisson_pmf lambda 0 + poisson_pmf lambda 1 = 2 * rexp (-↑lambda) := by
  --  --  rw [h₀, h₁] <;> ring_nf <;> simp_all [Real.exp_neg] <;> field_simp <;> ring_nf <;> simp_all [Real.exp_neg] <;>
    linarith
  hole