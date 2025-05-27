theorem h2 (h1 : f + g = C 2 * X ^ 2 - C 3) : C (-3) = C 5 :=
  by
  have h : ((-3 : ℤ) : ZMod 8) = (5 : ZMod 8) := by sorry
  --  rw [← sub_eq_zero]
  have h₂ : (C (-3) : Polynomial (ZMod 8)) = C 5 := by sorry
  --  rw [h₂] <;> simp [sub_eq_add_neg] <;> ring_nf <;> simp_all (config := { decide := true }) <;> rfl
  hole