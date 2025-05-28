theorem h₁ (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) (A : Matrix (Fin n) (Fin n) ℤ) (hA : veryodd A) (k : ℕ) (hk : k ≥ 1) (m : ℕ) (hm : m ∈ Set.Icc 1 n) (reind : Fin m → Fin n) (hreind : Function.Injective reind) : (A ^ k).submatrix reind reind = A.submatrix reind reind ^ k :=
  by
  --  rw [show (A ^ k) = A ^ k by rfl]
  --  induction' hk with k hk IH
  --  · ext i j
  --    simp [Matrix.one_apply, Matrix.submatrix_apply, Fin.ext_iff, pow_one] <;> aesop
  --  · rw [pow_succ', pow_succ]
  --  --    simp_all [Matrix.mul_submatrix_one, Matrix.submatrix_mul, Matrix.one_mul, Matrix.mul_one] <;> try rfl <;> aesop
  hole