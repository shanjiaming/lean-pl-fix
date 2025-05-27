theorem h_main (R : Type u_1) (inst✝² : Field R) (n : Type u_2) (inst✝¹ : Fintype n) (inst✝ : DecidableEq n) (A✝ : Matrix n n R) (ξ : n → R) (k✝ : R) (A : Matrix n n R) (k : R) (x : n → R) : ∀ (i : n), A.mulVec (k • x) i = (k • A.mulVec x) i :=
  by
  intro i
  calc
    (A.mulVec (k • x)) i = ∑ j : n, A i j * (k • x) j := by rw [Matrix.mulVec] <;> rfl
    _ = ∑ j : n, A i j * (k * x j) := by simp [Pi.smul_apply]
    _ = ∑ j : n, k * (A i j * x j) := by
      apply Finset.sum_congr rfl
      intro j _
      ring
    _ = k * ∑ j : n, A i j * x j := by rw [Finset.mul_sum] <;> simp [mul_assoc]
    _ = k * (A.mulVec x) i := by rw [Matrix.mulVec] <;> rfl
    _ = (k • (A.mulVec x)) i := by simp [Pi.smul_apply]