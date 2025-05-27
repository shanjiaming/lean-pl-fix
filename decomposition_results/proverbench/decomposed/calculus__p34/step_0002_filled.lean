theorem h_main  : ∫ (t : ℝ) in Set.Icc 0 1, integrand t = ∫ (t : ℝ) in Set.Icc 0 1, √(1 + (4 + 4 * Real.pi ^ 2) * t ^ 2) :=
  by
  --  apply congr_arg
  --  ext t
  --  rw [integrand] <;> simp [Set.Icc, Set.mem_setOf_eq] <;> ring_nf <;> norm_num <;> simp_all [Real.sqrt_eq_iff_sq_eq] <;>
        ring_nf <;>
      norm_num <;>
    linarith [Real.pi_pos]
  hole