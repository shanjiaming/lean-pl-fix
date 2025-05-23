theorem mulVec_smul (A : Matrix n n R) (k : R) (x : n → R) :
    A.mulVec (k • x) = k • (A.mulVec x) := by
  have h_main : ∀ (i : n), (A.mulVec (k • x)) i = (k • (A.mulVec x)) i := by
    intro i
    calc
      (A.mulVec (k • x)) i = ∑ j : n, A i j * (k • x) j := by
        rw [Matrix.mulVec]
        <;> rfl
      _ = ∑ j : n, A i j * (k * x j) := by
        simp [Pi.smul_apply]
      _ = ∑ j : n, k * (A i j * x j) := by
        apply Finset.sum_congr rfl
        intro j _
        ring
      _ = k * ∑ j : n, A i j * x j := by
        rw [Finset.mul_sum]
        <;> simp [mul_assoc]
      _ = k * (A.mulVec x) i := by
        rw [Matrix.mulVec]
        <;> rfl
      _ = (k • (A.mulVec x)) i := by
        simp [Pi.smul_apply]
  
  have h_final : A.mulVec (k • x) = k • (A.mulVec x) := by
    apply funext
    intro i
    apply h_main i
    <;> done
  
  exact h_final