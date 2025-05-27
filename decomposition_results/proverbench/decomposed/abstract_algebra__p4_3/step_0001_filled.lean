theorem sum_in_Z8  : f + g = C 2 * X ^ 2 + C 5 :=
  by
  have h1 : f + g = C 2 * X ^ 2 - C 3 := by sorry
  have h2 : (C (-3) : Polynomial (ZMod 8)) = C 5 := by sorry
  have h3 : C 2 * X ^ 2 - C 3 = C 2 * X ^ 2 + C 5 := by sorry
  have h4 : f + g = C 2 * X ^ 2 + C 5 := by sorry
  --  apply h4
  hole