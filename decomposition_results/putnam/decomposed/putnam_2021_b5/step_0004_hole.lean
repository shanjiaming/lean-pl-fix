theorem h₂ (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) (A : Matrix (Fin n) (Fin n) ℤ) (hA : veryodd A) (k : ℕ) (hk : k ≥ 1) (m : ℕ) (hm : m ∈ Set.Icc 1 n) (reind : Fin m → Fin n) (hreind : Function.Injective reind) (h₁ : (A ^ k).submatrix reind reind = A.submatrix reind reind ^ k) : Odd (A.submatrix reind reind).det :=
  by
  have h₃ : ∀ m ∈ Set.Icc 1 n, ∀ reind : Fin m → Fin n, Function.Injective reind → Odd (A.submatrix reind reind).det := by sorry
  have h₄ : m ∈ Set.Icc 1 n := hm
  have h₅ : Function.Injective reind := hreind
  --  exact h₃ m h₄ reind h₅
  hole