theorem h₁ (n : ℕ) (hn : 1 ≤ n) (A B : Matrix (Fin n) (Fin n) ℝ) (hA_ne_B : A ≠ B) (hA3 : A ^ 3 = B ^ 3) (hA2B : A ^ 2 * B = B ^ 2 * A) (i : Invertible (A ^ 2 + B ^ 2)) : (A ^ 2 + B ^ 2) * (A - B) = 0 := by
  --  calc
  --    (A ^ 2 + B ^ 2) * (A - B) = (A ^ 2 + B ^ 2) * A - (A ^ 2 + B ^ 2) * B := by
  --      rw [Matrix.mul_sub] <;> simp [Matrix.mul_add, Matrix.add_mul]
  --    _ = A ^ 3 + B ^ 2 * A - (A ^ 2 * B + B ^ 3) := by
  --      simp [pow_two, pow_three, Matrix.mul_assoc, Matrix.add_mul, Matrix.mul_add] <;> abel
  --    _ = A ^ 3 + B ^ 2 * A - (A ^ 2 * B + B ^ 3) := by rfl
  --    _ = 0 := by
  --      have h₂ : A ^ 3 = B ^ 3 := hA3
  --      have h₃ : A ^ 2 * B = B ^ 2 * A := hA2B
  --      rw [h₂]
  --      rw [h₃]
  --      simp [Matrix.mul_assoc, Matrix.add_mul, Matrix.mul_add] <;> abel
  --    _ = 0 := by simp
  hole