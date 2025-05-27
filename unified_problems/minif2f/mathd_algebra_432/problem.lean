theorem mathd_algebra_432 (x : ℝ) : (x + 3) * (2 * x - 6) = 2 * x ^ 2 - 18 := by
  have h_expand : (x + 3) * (2 * x - 6) = 2 * x ^ 2 - 6 * x + 6 * x - 18 := by
    ring_nf
    <;>
    linarith
  
  have h_simplify : 2 * x ^ 2 - 6 * x + 6 * x - 18 = 2 * x ^ 2 - 18 := by
    have h1 : 2 * x ^ 2 - 6 * x + 6 * x - 18 = 2 * x ^ 2 - 18 := by
      ring_nf
      <;>
      linarith
    rw [h1]
    <;>
    linarith
  
  have h_final : (x + 3) * (2 * x - 6) = 2 * x ^ 2 - 18 := by
    rw [h_expand]
    rw [h_simplify]
    <;>
    ring_nf
    <;>
    linarith
  
  apply h_final