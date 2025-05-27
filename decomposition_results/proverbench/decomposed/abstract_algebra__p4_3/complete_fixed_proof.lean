theorem sum_in_Z8 : f + g = C 2 * X ^ 2 + C 5:=
  by
  have h1 : f + g = C 2 * X ^ 2 - C 3:= by -- rw [sum_polynomials] <;> rfl
    hole
  have h2 : (C (-3) : Polynomial (ZMod 8)) = C 5:=
    by
    have h : ((-3 : ℤ) : ZMod 8) = (5 : ZMod 8):= by -- -- norm_num [ZMod.nat_cast_self] <;> rfl
      hole
    --  rw [← sub_eq_zero]
    have h₂ : (C (-3) : Polynomial (ZMod 8)) = C 5:=
      by
      --  rw [← ZMod.nat_cast_zmod_eq_zero_iff_dvd] at *
      norm_num [Polynomial.C_sub, Polynomial.C_add, Polynomial.C_mul] <;> simp_all [h] <;> ring_nf at * <;>
        simp_all (config := { decide := true })
      hole
    --  rw [h₂] <;> simp [sub_eq_add_neg] <;> ring_nf <;> simp_all (config := { decide := true }) <;> rfl
    hole
  have h3 : C 2 * X ^ 2 - C 3 = C 2 * X ^ 2 + C 5:= by
    --  calc
    --    C 2 * X ^ 2 - C 3 = C 2 * X ^ 2 + C (-3 : ZMod 8) := by
    --      simp [sub_eq_add_neg] <;> ring_nf <;> simp_all (config := { decide := true })
    --    _ = C 2 * X ^ 2 + C 5 := by rw [h2] <;> simp_all (config := { decide := true })
    hole
  have h4 : f + g = C 2 * X ^ 2 + C 5:= by
    --  rw [h1]
    --  rw [h3] <;> rfl
    hole
  --  apply h4
  hole