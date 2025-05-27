theorem h₁ (n : Type u) (inst✝³ : Fintype n) (inst✝² : DecidableEq n) (K : Type u_1) (inst✝¹ : Field K) (P : Matrix n n K) (inst✝ : Invertible P) (h₀ : P.det * P⁻¹.det = 1) : P⁻¹.det = P.det⁻¹ :=
  by
  have h₂ : det P ≠ 0 := by sorry
  apply inv_eq_of_mul_eq_one_right <;> simpa [h₂] using h₀