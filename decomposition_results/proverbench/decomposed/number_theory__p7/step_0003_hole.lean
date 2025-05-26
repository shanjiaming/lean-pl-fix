theorem h₁ (h : ¬∃ x y, x ^ 2 - sorry * y ^ 2 = 2) : ∃ x y, x ^ 2 - sorry * y ^ 2 = -2 := by
  --  --  --  --  use 0, 0 <;> simp_all [Int.mul_emod, Int.sub_emod, pow_two] <;> (try contradiction) <;> (try ring_nf at * <;> omega)
  hole