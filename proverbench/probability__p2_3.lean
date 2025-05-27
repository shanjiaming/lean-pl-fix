theorem X3 : A * (A * (A * X0)) = ![![0.38], ![0.18], ![0.44]] := by
  have h1 : A * (A * (A * X0)) = (A * (A * A)) * X0 := by
    rw [show A * (A * (A * X0)) = (A * (A * A)) * X0 by
      rw [← Matrix.mul_assoc]
      <;> simp [Matrix.mul_assoc]
      ]
    <;>
    simp [Matrix.mul_assoc]
    <;>
    rfl
  
  have h2 : (A * (A * A)) * X0 = A_cubed * X0 := by
    rw [A_cubed]
    <;>
    simp [Matrix.mul_assoc]
    <;>
    rfl
  
  have h3 : A_cubed * X0 = ![![0.38], ![0.18], ![0.44]] := by
    have h₃ : A_cubed * X0 = (A * (A * A)) * X0 := by
      rw [A_cubed]
      <;>
      simp [Matrix.mul_assoc]
      <;>
      rfl
    rw [h₃]
    ext i j
    fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Fin.sum_univ_succ, A, X0, A_squared, A_cubed]
    <;> norm_num
    <;> rfl
  
  have h4 : A * (A * (A * X0)) = ![![0.38], ![0.18], ![0.44]] := by
    rw [h1, h2, h3]
    <;>
    simp [Matrix.mul_assoc]
    <;>
    rfl
  
  rw [h4]
  <;>
  simp [Matrix.mul_assoc]
  <;>
  rfl