theorem simplify_LHS_numerator : 2 * sqrt 13 - 5 * sqrt 65 = (2 - 5 * sqrt 5) * sqrt 13 := by
  have h1 : (2 - 5 * sqrt 5) * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 5 * sqrt 13 := by
    admit
  
  have h2 : 2 * sqrt 13 - 5 * sqrt 5 * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 65 := by
    have h2₁ : sqrt 5 * sqrt 13 = sqrt 65 := sqrt_five_times_sqrt_thirteen
    have h2₂ : 5 * sqrt 5 * sqrt 13 = 5 * (sqrt 5 * sqrt 13) := by ring
    rw [h2₂, h2₁]
    <;> ring_nf
    <;>
    simp [sqrt_five_times_sqrt_thirteen]
    <;>
    ring_nf
    <;>
    linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]
  
  have h3 : 2 * sqrt 13 - 5 * sqrt 65 = 2 * sqrt 13 - 5 * sqrt 65 := by admit
  
  have h4 : (2 - 5 * sqrt 5) * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 65 := by
    admit
  
  have h5 : 2 * sqrt 13 - 5 * sqrt 65 = (2 - 5 * sqrt 5) * sqrt 13 := by
    admit
  
  admit