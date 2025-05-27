theorem h3 (h1 : f + g = C 2 * X ^ 2 - C 3) (h2 : C (-3) = C 5) : C 2 * X ^ 2 - C 3 = C 2 * X ^ 2 + C 5 := by
  --  calc
  --    C 2 * X ^ 2 - C 3 = C 2 * X ^ 2 + C (-3 : ZMod 8) := by
  --      simp [sub_eq_add_neg] <;> ring_nf <;> simp_all (config := { decide := true })
  --    _ = C 2 * X ^ 2 + C 5 := by rw [h2] <;> simp_all (config := { decide := true })
  hole