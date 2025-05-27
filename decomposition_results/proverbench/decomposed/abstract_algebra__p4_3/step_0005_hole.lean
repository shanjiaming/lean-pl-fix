theorem h₂ (h1 : f + g = C 2 * X ^ 2 - C 3) (h : ↑(-3) = 5) : C (-3) = C 5 :=
  by
  --  rw [← ZMod.nat_cast_zmod_eq_zero_iff_dvd] at *
  norm_num [Polynomial.C_sub, Polynomial.C_add, Polynomial.C_mul] <;> simp_all [h] <;> ring_nf at * <;>
    simp_all (config := { decide := true })
  hole