theorem h₈ (n : ℕ) (npos : n ≥ 1) (veryodd : Matrix (Fin n) (Fin n) ℤ → Prop) (hveryodd :  ∀ (A : Matrix (Fin n) (Fin n) ℤ),    veryodd A ↔      ∀ m ∈ Set.Icc 1 n, ∀ (reind : Fin m → Fin n), Function.Injective reind → Odd (A.submatrix reind reind).det) (A : Matrix (Fin n) (Fin n) ℤ) (hA : veryodd A) (k : ℕ) (hk : k ≥ 1) (m : ℕ) (hm : m ∈ Set.Icc 1 n) (reind : Fin m → Fin n) (hreind : Function.Injective reind) (h₁ : (A ^ k).submatrix reind reind = A.submatrix reind reind ^ k) (h₂ : Odd (A.submatrix reind reind).det) (h₄ : (A.submatrix reind reind ^ k).det = (A.submatrix reind reind).det ^ k) (h₅ h₇ : Odd (A.submatrix reind reind).det) : Odd ((A.submatrix reind reind).det ^ k) :=
  by
  have h₉ : (A.submatrix reind reind).det % 2 = 1 := by sorry
  have h₁₀ : ((A.submatrix reind reind).det ^ k) % 2 = 1 := by sorry
  --  cases' Int.emod_two_eq_zero_or_one ((A.submatrix reind reind).det ^ k) with h h <;>
  --      simp_all [Int.odd_iff_not_even, Int.even_iff] <;>
  --    omega
  hole