theorem simplify_LHS_numerator  : 2 * √13 - 5 * √65 = (2 - 5 * √5) * √13 :=
  by
  have h1 : (2 - 5 * sqrt 5) * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 5 * sqrt 13 := by sorry
  have h2 : 2 * sqrt 13 - 5 * sqrt 5 * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 65 := by sorry
  have h3 : 2 * sqrt 13 - 5 * sqrt 65 = 2 * sqrt 13 - 5 * sqrt 65 := by sorry
  have h4 : (2 - 5 * sqrt 5) * sqrt 13 = 2 * sqrt 13 - 5 * sqrt 65 := by sorry
  have h5 : 2 * sqrt 13 - 5 * sqrt 65 = (2 - 5 * sqrt 5) * sqrt 13 := by sorry
  --  rw [h5] <;> linarith
  hole