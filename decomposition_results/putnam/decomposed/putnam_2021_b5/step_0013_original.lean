theorem h₁₂ (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) (A : Matrix (Fin n) (Fin n) ℤ) (hA : veryodd A) (k : ℕ) (hk : k ≥ 1) (m : ℕ) (hm : m ∈ Set.Icc 1 n) (reind : Fin m → Fin n) (hreind : Function.Injective reind) (h₁ : (A ^ k).submatrix reind reind = A.submatrix reind reind ^ k) (h₂ : Odd (A.submatrix reind reind).det) (h₄ : (A.submatrix reind reind ^ k).det = (A.submatrix reind reind).det ^ k) (h₅ h₇ : Odd (A.submatrix reind reind).det) (h₉ h₁₁ : (A.submatrix reind reind).det % 2 = 1) : (A.submatrix reind reind).det ^ k % 2 = 1 := by
  calc
    ((A.submatrix reind reind).det ^ k) % 2 = (((A.submatrix reind reind).det) % 2) ^ k % 2 := by
      simp [pow_mod, Nat.pow_mod]
    _ = 1 ^ k % 2 := by rw [h₁₁]
    _ = 1 % 2 := by simp
    _ = 1 := by norm_num