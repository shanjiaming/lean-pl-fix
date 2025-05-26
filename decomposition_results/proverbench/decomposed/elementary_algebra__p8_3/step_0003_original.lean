theorem h2 (h1 : (2 - 5 * sorry) * sorry = 2 * sorry - 5 * sorry * sorry) : 2 * sorry - 5 * sorry * sorry = 2 * sorry - 5 * sorry :=
  by
  have h2₁ : sqrt 5 * sqrt 13 = sqrt 65 := sqrt_five_times_sqrt_thirteen
  have h2₂ : 5 * sqrt 5 * sqrt 13 = 5 * (sqrt 5 * sqrt 13) := by ring
  rw [h2₂, h2₁] <;> ring_nf <;> simp [sqrt_five_times_sqrt_thirteen] <;> ring_nf <;>
    linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]