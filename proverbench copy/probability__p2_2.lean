lemma A_cubed : A * (A * A) = ![![0.26, 0.38, 0.52], ![0.16, 0.18, 0.195], ![0.58, 0.44, 0.285]] := by
  have h₁ : A * (A * A) = ![![0.26, 0.38, 0.52], ![0.16, 0.18, 0.195], ![0.58, 0.44, 0.285]] := by
    rw [A_squared]
    ext i j
    fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, Fin.sum_univ_succ, A, pow_two, pow_three]
    <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ, pow_two, pow_three]
    <;> rfl
  exact h₁