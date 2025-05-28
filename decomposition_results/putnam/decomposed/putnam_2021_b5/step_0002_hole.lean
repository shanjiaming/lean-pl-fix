theorem h_main (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) (A : Matrix (Fin n) (Fin n) ℤ) (hA : veryodd A) (k : ℕ) (hk : k ≥ 1) : veryodd (A ^ k) := by
  --  rw [hveryodd]
  --  intro m hm reind hreind
  have h₁ : (A ^ k).submatrix reind reind = ((A.submatrix reind reind) ^ k) := by sorry
  --  rw [h₁]
  have h₂ : Odd (A.submatrix reind reind).det := by sorry
  have h₃ : Odd ((A.submatrix reind reind) ^ k).det := by sorry
  --  exact h₃
  hole