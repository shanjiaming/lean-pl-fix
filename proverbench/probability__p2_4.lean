theorem probability_location_2 : (A * (A * (A * X0))) 1 0 = 0.18 := by
  have h_main : (A * (A * (A * X0))) 1 0 = 0.18 := by
    have h₁ : A * (A * (A * X0)) = ![![0.38], ![0.18], ![0.44]] := by
      exact X3
    rw [h₁]
    <;> norm_num [Matrix.dotProduct, Matrix.mul_apply, Fin.sum_univ_succ, A, X0]
    <;> rfl
  
  exact h_main