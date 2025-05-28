theorem h₃ (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) (A : Matrix (Fin n) (Fin n) ℤ) (hA : veryodd A) (k : ℕ) (hk : k ≥ 1) (m : ℕ) (hm : m ∈ Set.Icc 1 n) (reind : Fin m → Fin n) (hreind : Function.Injective reind) (h₁ : (A ^ k).submatrix reind reind = A.submatrix reind reind ^ k) : ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det :=
  by
  --  intro m hm reind hreind
  --  exact (hveryodd A).mp hA m hm reind hreind
  hole