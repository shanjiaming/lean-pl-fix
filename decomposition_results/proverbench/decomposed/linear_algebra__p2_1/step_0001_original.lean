theorem verify_inverse  : sorry * sorry = 1 ∧ sorry * sorry = 1 :=
  by
  have h1 : A * A_inv = 1 := by sorry
  have h2 : A_inv * A = 1 := by sorry
  have h3 : A * A_inv = 1 ∧ A_inv * A = 1 := by sorry
  exact h3