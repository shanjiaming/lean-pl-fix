theorem curveLength_integral :
∫ (t : ℝ) in Set.Icc 0 1, integrand t = ∫ (t : ℝ) in Set.Icc 0 1, Real.sqrt (1 + (4 + 4 * Real.pi ^ 2) * t ^ 2) := by
  have h_main : (∫ (t : ℝ) in Set.Icc 0 1, integrand t) = ∫ (t : ℝ) in Set.Icc 0 1, Real.sqrt (1 + (4 + 4 * Real.pi ^ 2) * t ^ 2) := by
    apply congr_arg
    ext t
    rw [integrand]
    <;>
    simp [Set.Icc, Set.mem_setOf_eq]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    simp_all [Real.sqrt_eq_iff_sq_eq]
    <;>
    ring_nf
    <;>
    norm_num
    <;>
    linarith [Real.pi_pos]
  
  rw [h_main]
  <;>
  simp_all [Set.Icc, Set.mem_setOf_eq]
  <;>
  ring_nf
  <;>
  norm_num
  <;>
  simp_all [Real.sqrt_eq_iff_sq_eq]
  <;>
  ring_nf
  <;>
  norm_num
  <;>
  linarith [Real.pi_pos]